FactoryBot.define do
  factory :class_room do
    Faker::Config.locale = :ja
    school { FactoryBot.create(:school) }
    grade { Faker::Number.within(range: 1..7) }
    class_number { Faker::Number.within(range: 1..10) }
    class_goals { Faker::Lorem.sentence }
  end
end
