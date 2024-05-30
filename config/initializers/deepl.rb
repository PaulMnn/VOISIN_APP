DeepL.configure do |config|
  config.host = ENV.fetch('DEEPL_HOST', 'https://api-free.deepl.com') # Set api.deepl.com for production API
  config.auth_key = ENV.fetch('DEEPL_KEY')
end
