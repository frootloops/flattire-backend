class Api::V1::RequestSerializer < ActiveModel::Serializer
  attributes :id, :status, :address, :cause, :latitude, :longitude
  belongs_to :driver
end

