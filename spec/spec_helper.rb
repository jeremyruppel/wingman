# Set the environment variables for the test app
ENV[ 'RAILS_ENV' ] = 'test'
# ENV[ 'RAILS_ROOT' ] =

# Add the test app to the load path
$: << ENV[ 'WINGMAN_RAILS_PATH' ]

# Require all dependencies
Bundler.require

# Boot the rails app
require 'config/environment'

# Require test dependencies *after* rails
require 'rspec/rails'
require 'shoulda'

# Configure RSpec
RSpec.configure do |config|
  # Use color
  config.color_enabled = true
  # Change the formatter
  config.formatter = :documentation
end
