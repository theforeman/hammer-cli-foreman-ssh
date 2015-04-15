require File.expand_path('../lib/hammer_cli_foreman_ssh/version', __FILE__)

Gem::Specification.new do |s|

  s.name = "hammer_cli_foreman_ssh"
  s.version = HammerCLIForemanSsh.version.dup
  s.platform = Gem::Platform::RUBY
  s.authors = ["Ohad Levy"]
  s.license = 'GPLv3+'
  s.summary = %q{Adds Remote SSH support to Hammer Foreman CLI}

  s.files = Dir['{config,lib}/**/*', 'LICENSE', 'README*']
  s.require_paths = ["lib"]

  s.add_dependency 'hammer_cli', '>= 0.0.6'
  s.add_dependency 'hammer_cli_foreman'
  s.add_dependency 'net-ssh-multi'
end
