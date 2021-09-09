What is the Rakefile doing?
- Define rake tasks and dependencies

What is happening in config/environment.rb?
- Configuring development environment
- Enables components to interact with one another
- Establish database connection
- Configures bundler
- Make sure necessary controllers are loaded in env

What is happening in config.ru?
- Mount controllers + run application controller
- Allows application to start

What is Rack::MethodOverride?
- Middleware that allows us to use patch and delete methods