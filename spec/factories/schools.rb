FactoryBot.define do
  factory :school do
    Faker::Config.locale = :ja
    name { Faker::University.name }
  end
end
