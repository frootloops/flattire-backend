class Driver < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:phone]
  has_one_time_password counter_based: true
end
