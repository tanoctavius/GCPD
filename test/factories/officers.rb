FactoryBot.define do
  factory :officer do
    first_name { "John" }
    last_name { "Blake" }
    association :unit
    rank { "Detective Sergeant" }
    ssn { rand(9 ** 9).to_s.rjust(9,'0') }
    role { 1 }
    username { "jblake" }
    password { "secret" }
    password_confirmation { "secret" }
    active { true }
  end
end
