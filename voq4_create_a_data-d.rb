# voq4_create_a_data-d.rb

# Description:
# This Ruby script simulates a data-driven mobile app, generating random user data and emulating interactions.

# Requirements:
# - Ruby 2.7 or higher
# - JSON gem (run `gem install json` to install)

require 'json'
require 'securerandom'
require 'date'

# Configuration
MAX_USERS = 100
MAX_INTERACTIONS = 500
USER_DATA_KEYS = %w[name email age location]
INTERACTION_TYPES = %w[tap swipe scroll]

# Data Generators
def generate_user_data
  {
    name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    email: "#{SecureRandom.hex}@example.com",
    age: rand(18..65),
    location: "#{Faker::Address.city}, #{Faker::Address.country}"
  }
end

def generate_interaction(user_id, interaction_type)
  {
    user_id: user_id,
    type: interaction_type,
    timestamp: DateTime.now.to_s,
    metadata: { x: rand(0..100), y: rand(0..100) }
  }
end

# Simulator
users = MAX_USERS.times.map { generate_user_data }
interactions = MAX_INTERACTIONS.times.map do
  user_id = rand(0..(MAX_USERS - 1))
  generate_interaction(user_id, INTERACTION_TYPES.sample)
end

# Output
puts JSON.pretty_generate({
  users: users,
  interactions: interactions
})