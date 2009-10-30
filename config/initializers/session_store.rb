# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
#ActionController::Base.session = {
#  :key         => '_service_lona_session',
#  :secret      => 'fa3fc1fdcb316daaa1f8efef8291f69a80d0c64111ba7f41c32b0799ab6dd8416eeaa3b4d2009f690c5a65947fc244c6b96ce54513fa86f71660092468ab0670'
#}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
config.action_controller.session_store = :active_record_store