# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    make "MyString"
    color "MyString"
    year 1999
    mileage 1
    description "MyText"
  end
end
