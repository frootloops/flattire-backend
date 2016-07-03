class Driver < ApplicationRecord
  devise :database_authenticatable, authentication_keys: [:phone]
end
