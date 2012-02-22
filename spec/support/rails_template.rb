# Clean up the app a bit
run 'rm -r test'
run 'rm -r doc'
run 'rm -r README.rdoc'
run 'rm -r vendor'

# Add our wingman dependency
gem 'wingman'

# Mount the wingman app
route "mount Wingman::Engine => '/status'"

# Create the wingman initializer
# initializer 'wingman.rb', <<-CODE
# # TODO write the initializer
# CODE
