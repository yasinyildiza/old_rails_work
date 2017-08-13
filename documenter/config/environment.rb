# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Documenter::Application.initialize!
ActionMailer::Base.delivery_method = :smtp