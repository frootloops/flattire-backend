FactoryGirl.define do
  factory :driver do
    name "Arsen Gasparyan"
    email "to.arsen.gasparyan@gmail.com"
    phone { "+7999#{rand(100_00_00..999_99_99)}" }
  end
end
