FactoryBot.define do
  factory :user do
    Faker::Config.locale = :ja
    class_room { FactoryBot.create(:class_room) }
    email { Faker::Internet.free_email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    nickname { Faker::Name.last_name }
    attendance_number { Faker::Number.between(from: 1, to: 40) }
    password = Faker::Internet.password(min_length: 15)
    password { password }
    password_confirmation { password }

  end
end
