class Driver < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:phone]
  has_one_time_password length: 4
  validates :phone, phone: true, uniqueness: true
  acts_as_token_authenticatable
end
