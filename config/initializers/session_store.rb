# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_markdownr.com_session',
  :secret      => 'a36e1e3a197af9b9112dc60058c4b0c25fd1d28542d41dc0115d0a5b0900e0d07fb65587fd7aa07b087a23e9425d11e5ee93a2ebca26040abe1e953e06343246'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
