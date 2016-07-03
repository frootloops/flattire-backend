class Driver < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:phone]
  has_one_time_password length: 4
  validates_uniqueness_of :phone
  validates :phone, phone: true
end
