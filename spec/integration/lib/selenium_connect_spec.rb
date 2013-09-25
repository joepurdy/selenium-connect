# Encoding: utf-8

require 'spec_helper'
require 'selenium_connect'

describe SeleniumConnect, :system do
  let(:sc) { SeleniumConnect }

  it 'should run a basic job using default settings' do
    job = sc.run_job
    execute_simple_test job.driver
    job.finish
  end
end
