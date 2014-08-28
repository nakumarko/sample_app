# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '1e40a6d82241527a18eced5c9a2d723372605ac612a6539f718e852c9d5690e5e159a732a8a967baf4953d89d340440ba4db6507bed0458a3eefc79f6d1664f5'

require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
      if File.exist?(token_file)
        # Use the existing token.
        File.read(token_file).chomp
      else
        # Generate a new token and store it in token_file.
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
      end
end

SampleApp::Application.config.secret_key_base = secure_token
