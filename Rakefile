require 'bundler/gem_tasks'
require 'appraisal'
require 'rspec/core/rake_task'

namespace :wingman do

  desc "Set up current environment variables"
  task :env do
    require 'rails/version'
    ENV[ 'WINGMAN_RAILS_NAME' ] = "rails-#{Rails::VERSION::STRING}"
    ENV[ 'WINGMAN_RAILS_PATH' ] = "spec/rails/#{ENV[ 'WINGMAN_RAILS_NAME' ]}"
  end

  desc "Create a test rails app if necessary"
  task :rails do
    if File.exist? ENV[ 'WINGMAN_RAILS_PATH' ]
      puts "Using existing #{ENV[ 'WINGMAN_RAILS_NAME' ]} app"
    else
      sh "bundle exec rails new #{ENV[ 'WINGMAN_RAILS_PATH' ]}"
    end
  end

end

RSpec::Core::RakeTask.new :spec => [ :'wingman:env', :'wingman:rails' ]
