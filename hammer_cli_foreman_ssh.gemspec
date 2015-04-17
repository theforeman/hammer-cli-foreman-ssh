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
  s.add_dependency 'net-ssh-multi', '>= 1.2.1'

  s.add_development_dependency 'rake', '~> 10.1.0'
  s.add_development_dependency 'thor'
  s.add_development_dependency 'minitest', '4.7.4'
  s.add_development_dependency 'minitest-spec-context'
  s.add_development_dependency 'simplecov', '< 0.9.0' # 0.9.0 is not compatible with Ruby 1.8.x
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'ci_reporter', '>= 1.6.3', '< 2.0.0'

end
