class Driver < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:phone]
  has_one_time_password counter_based: true
  validates_uniqueness_of :phone
  validates :phone, phone: true
end
