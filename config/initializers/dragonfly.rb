require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "70ec23d21ac6a14611824898c53768f42b4deea2bdef1ccfe8a66802511a1108"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly/development'),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
