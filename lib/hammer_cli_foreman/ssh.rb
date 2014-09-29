require 'hammer_cli'
require 'hammer_cli_foreman/host'
require 'net/ssh/multi'

module HammerCLIForeman::SSH
  class Command < HammerCLIForeman::Command

    DEFAULT_PER_PAGE = 1000

    resource :hosts
    action :index

    command_name 'SSH to hosts'
    option %w(-c --command), 'COMMAND', _('Command to execute'), :attribute_name => :command, :required => true
    option %w(-u --user), 'USER', _('Execute as user'), :attribute_name => :user, :default => ENV['USER']
    option %w(-s --search), 'FILTER', _('Filter hosts based on a filter'), :attribute_name => :search
    option '--[no-]dns', :flag, _('Use DNS to resolve IP addresses'), :attribute_name => :use_dns
    option '--[no-]prompt', :flag, _('Prompt for users approval'), :attribute_name => :prompt

    def request_params
      params             = super
      params['search']   ||= search
      params['per_page'] ||= HammerCLI::Settings.get(:ui, :per_page) || DEFAULT_PER_PAGE
      params
    end

    def execute
      puts _("About to execute: #{command} as user #{user}\n" +
      "on the following #{hosts.size} hosts: #{host_names.join(', ')}")

      unless prompt? == false || ask(_('Continue, (y/N)')).downcase == 'y'
        warn _('aborting per user request')
        return HammerCLI::EX_OK
      end

      ssh_options = { :user => user, :auth_methods => ['publickey'] }

      Net::SSH::Multi.start(:on_error => :warn) do |session|
        targets.each { |s| session.use s, ssh_options }
        session.exec command
        session.loop
      end

      HammerCLI::EX_OK
    end

    private

    def response
      @response ||= send_request
    end

    def hosts
      @hosts ||= response['results']
    end

    def host_names
      @host_names ||= hosts.map { |h| h['name'] }
    end

    def targets
      (use_dns?.nil? || use_dns?) ? host_names : host_ips
    end

    def host_ips
      @host_ips ||= hosts.map { |h| h['ip'] }
    end

  end

  HammerCLIForeman::Host.subcommand('ssh', _('Remote execution via SSH to selected hosts'), HammerCLIForeman::SSH::Command)
end
