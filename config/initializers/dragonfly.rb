require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "70ec23d21ac6a14611824898c53768f42b4deea2bdef1ccfe8a66802511a1108"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
      root_path: Rails.root.join('public/system/dragonfly', Rails.env),
      server_root: Rails.root.join('public')
  else
    datastore :s3,
      bucket_name: 'odontokits',
      access_key_id: 'AKIAJHZU42DAP7UWL3HQ',
      secret_access_key: '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',
      region: 'sa-east-1',
      url_scheme: 'https'
  end
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
