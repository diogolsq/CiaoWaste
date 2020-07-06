FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name  { "Doe" }
    email { "johndoe01@gmail.com"}
    password { "1234567"}
    Admin { false }
    address { "5th avenue 100, new york"}
  end
end
