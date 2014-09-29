$:.unshift File.expand_path("../lib", __FILE__)
require "hammer_cli_foreman/ssh/version"

Gem::Specification.new do |s|

  s.name = "hammer_cli_foreman_ssh"
  s.version = HammerCLIForeman::SSH.version.dup
  s.platform = Gem::Platform::RUBY
  s.authors = ["Ohad Levy"]
  s.summary = %q{Adds Remote SSH support to Hammer Foreman CLI}

  s.files = Dir['lib/**/*.rb']
  s.require_paths = ["lib"]

  s.add_dependency 'hammer_cli', '>= 0.0.6'
  s.add_dependency 'hammer_cli_foreman'
  s.add_dependency 'net-ssh-multi'
end
