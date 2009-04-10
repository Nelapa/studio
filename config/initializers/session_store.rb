# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_studio_session',
  :secret      => '3ded7de7e6554a8069b80667cdf303836fcbb3ab10cb60e274f7d285c45939e5fd35fa458c09270bf16d8c8103e1848f0e7b2f18c29f577f58a85456361745c6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
