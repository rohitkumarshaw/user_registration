# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_user_registration_session',
  :secret      => '70ff450547fde19098b7fa60532dd9f8345b660518fdce277a8cece4cad23cfcf072e35ec346383219d22fb53c35ea5f4b28dffc55eda366b5a48789e7306589'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
