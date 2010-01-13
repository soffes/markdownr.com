# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_markdownr.com_session',
  :secret => 'abd9031b19a57f5619aa110aa51f678be5b43f0fbe27e7c7dc743cdf5bde35258f110acb310cd0e174a7afa402eb04bd037156a2ed7892cd3c71d0ba296fb156'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
