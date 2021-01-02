FactoryBot.define do
  factory :message do
    Faker::Config.locale = :ja
    content { Faker::Lorem.sentence }

    association :class_room
    association :user
  end
end
