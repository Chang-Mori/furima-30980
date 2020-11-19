FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"フリマ"}
    first_name            {"太郎"}
    family_name_kana      {"フリマ"}
    first_name_kana       {"タロウ"}
    birthday              {"1930-01-31"}
  end
end