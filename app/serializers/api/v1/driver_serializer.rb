class Api::V1::DriverSerializer < ActiveModel::Serializer
  attributes :phone, :name, :email
end

