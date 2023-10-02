require 'rake/testtask'
require 'bundler/gem_tasks'
require 'ci/reporter/rake/minitest'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = Dir.glob('test/**/*_test.rb')
  t.verbose = true
end

require "hammer_cli_foreman_ssh/version"
require "hammer_cli_foreman_ssh/i18n"
require "hammer_cli/i18n/find_task"
HammerCLI::I18n::FindTask.define(HammerCLIForemanSsh::I18n::LocaleDomain.new, HammerCLIForemanSsh.version.to_s)
