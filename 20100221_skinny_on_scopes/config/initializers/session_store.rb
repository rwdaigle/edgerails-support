# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_rails3app_session',
  :secret => 'c5f7a3201dad4582884966e19a754164b8b7ab824899839e618a1261ee68e813ee8d103c16e83b463a5faa79526453cb9f77f5e365ff4b4a5487b3fdb13f0921'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
