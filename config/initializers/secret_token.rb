if Rails.env.development? or Rails.env.test?
  HCEF::Application.config.secret_key_base = 'd30b2bf926bf1c07b3311166cefd217a26382c61e779749e73b710583f4b515706d3562cb24c493d88c1d5663a47b6c9ed941c0597958aed406d5029725d3aef'
else
  HCEF::Application.config.secret_key_base = ENV["HCEF_SECRET_KEY_BASE"]
end
