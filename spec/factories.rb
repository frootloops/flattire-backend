FactoryGirl.define do
  factory :request do
    driver { create(:driver) }
    status :pending
    address "Chelyuskinskaya ulitsa 10"
    cause "Flat tire"
    latitude 55.8836498
    longitude 37.7085781
  end

  factory :driver do
    name "Arsen Gasparyan"
    email "to.arsen.gasparyan@gmail.com"
    phone { "+7999#{rand(100_00_00..999_99_99)}" }
  end
end
