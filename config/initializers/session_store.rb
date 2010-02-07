# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_Markdownr_session',
  :secret => '0b6b3391b486b14f151afad5ed267ce2ff08f184beaebe4af55df4bd840eb0a1be2253edc500aeb8edc2ea8f86acd6b5fb6ee0a3341674b69907644efc84b747'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
