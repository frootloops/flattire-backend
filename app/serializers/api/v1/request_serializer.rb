class Api::V1::RequestSerializer < ActiveModel::Serializer
  attributes :id, :status, :status, :address, :cause, :latitude, :longitude
end

