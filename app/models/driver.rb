class Driver < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:phone]
  has_one_time_password length: 4
  validates :phone, uniqueness: true, phone: { possible: true,
    allow_blank: false, types: [:mobile] }
  acts_as_token_authenticatable

  scope :within_radius, -> (latitude, longitude, metres) {
    query = "earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)"
    where(query, latitude, longitude, metres)
  }

  has_many :requests
end
