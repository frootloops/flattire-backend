class Request < ApplicationRecord
  belongs_to :driver
  enum status: [ :pending, :canceled, :done ]

  scope :within_radius, -> (latitude, longitude, metres) {
    query = "earth_box(ll_to_earth(?, ?), ?) @> ll_to_earth(latitude, longitude)"
    where(query, latitude, longitude, metres)
  }

  validates :driver, :status, :cause, :address, :latitude, :longitude,
    presence: true
end
