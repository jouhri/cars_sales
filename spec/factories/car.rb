FactoryGirl.define do
  factory :car do
    name { Faker::Name.first_name }
    price  { 10000 }
    year { 1985 }
    brand { "BMW" }
    engine { "v12" }
    color { "red" }
  end

end
