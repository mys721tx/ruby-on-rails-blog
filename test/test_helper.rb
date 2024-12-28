ENV["RAILS_ENV"] ||= "test"

# Setup test credentials for demo authentication before loading the application
if Rails.env.test?
  demo_auth_fixture = YAML.load_file(File.join(__dir__, "fixtures", "demo_auth.yml"))["demo"]
  Rails.application.credentials.config.merge!({
    demo_auth: {
      username: demo_auth_fixture["username"],
      password: demo_auth_fixture["password"]
    }
  })
end

require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
