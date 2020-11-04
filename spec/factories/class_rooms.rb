FactoryBot.define do
  factory :class_room do
    Faker::Config.locale = :ja
    school_id { 1 }
    grade { Faker::Number.within(range: 1..7) }
    class_number { Faker::Number.within(range: 1..10) }
    class_goals { Faker::Lorem.sentence }
  end
end
