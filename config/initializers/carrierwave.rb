CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJL4K4SJYX3N7QUBQ',
      aws_secret_access_key: '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',
      host:                  'http://s3-ap-northeast-1.amazonaws.com',
      region:                'ap-northeast-1'
    }
    config.fog_directory  = ENV["just-dessert2"]
  else
    config.storage :file
  end
end