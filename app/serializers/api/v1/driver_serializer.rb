class Api::V1::DriverSerializer < ActiveModel::Serializer
  attributes :phone, :name, :email
  has_many :requests do
    object.requests.available
  end
end

