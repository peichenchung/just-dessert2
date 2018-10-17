CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws' 
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['aws_access_key_id'],
      aws_secret_access_key: ENV['aws_secret_access_key'],
      host:                  'http://s3-ap-northeast-1.amazonaws.com',
      region:                'ap-northeast-1'
    }
    config.fog_directory  = ENV['fog_directory']
  else
    config.storage :file
  end
end