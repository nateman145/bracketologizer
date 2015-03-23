# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_TwitterProject_session',
  :secret      => '0f74661c6ef3a3c564aa35a5f7325876e6a4f15b6574ceb542f37c4b7d23a537dda07722b1e3857a21120693b8d813d2d25aba4af2ecbbea4a7b646e1e718f12'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
