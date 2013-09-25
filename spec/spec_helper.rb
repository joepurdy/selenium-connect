# Encoding: utf-8

# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

require 'simplecov'
require 'coveralls'

require 'support/integration_helper'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  coverage_dir 'build/coverage'
end

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.before(:all) do
    setup_test_environment
  end

  config.before(:each) do
    FileUtils.rm_rf(File.join(Dir.pwd, 'build', 'tmp'))
    Dir.mkdir(File.join(Dir.pwd, 'build', 'tmp'))
  end
  config.order = 'random'
end

def setup_test_environment
  ENV['SUPPORT_PATH'] = File.join(Dir.pwd, 'spec', 'support')
  ENV['BUILD_PATH'] = File.join(Dir.pwd, 'build')
end
