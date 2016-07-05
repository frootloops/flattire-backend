class Api::V1::TokenSerializer < ActiveModel::Serializer
  attributes :token, :driver

  def token
    object.authentication_token
  end

  def driver
    Api::V1::DriverSerializer.new(object).attributes
  end
end

