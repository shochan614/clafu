FactoryBot.define do
  factory :message do
    Faker::Config.locale = :ja
    content { Faker::Lorem.sentence }

    association :class_room
    association :user

    # after(:build) do |content|
    #   content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    # end
  end
end
