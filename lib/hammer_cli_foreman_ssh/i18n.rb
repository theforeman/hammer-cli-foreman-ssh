require 'hammer_cli/i18n'

module HammerCLIForemanSsh
  module I18n
    class LocaleDomain < HammerCLI::I18n::LocaleDomain
      def translated_files
        Dir.glob(File.join(File.dirname(__FILE__), '../**/*.rb'))
      end

      def locale_dir
        File.join(File.dirname(__FILE__), '../../locale')
      end

      def domain_name
        'hammer-cli-foreman-ssh'
      end
    end

    class SystemLocaleDomain < LocaleDomain
      def locale_dir
        '/usr/share/locale'
      end
    end
  end
end

domain = [HammerCLIForemanSsh::I18n::LocaleDomain.new, HammerCLIForemanSsh::I18n::SystemLocaleDomain.new].find { |d| d.available? }
HammerCLI::I18n.add_domain(domain) if domain
