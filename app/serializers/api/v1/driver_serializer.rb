class Api::V1::DriverSerializer < ActiveModel::Serializer
  attributes :phone, :name, :email, :access_token

  def access_token
    object.authentication_token
  end
end

