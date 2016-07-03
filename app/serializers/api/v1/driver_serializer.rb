class Api::V1::DriverSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :email
end

