CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     'AKIAJ6INWAZTV64RLGPQ',
      aws_secret_access_key: '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',
      region:                'ap-northeast-1'
    }
    config.fog_directory  = 'just-dessert2'
  else
    config.storage :file
  end
end