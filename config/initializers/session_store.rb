# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_markdownr.com_session',
  :secret      => 'ab8ada9b5e0554ccae733603e39230c3b37094673fb4bbc90fdc9f4cd987046cc38e15e171ce76c3a655e7e2979c00b42aded00a1c546587e951c504a1461fe9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
