FactoryGirl.define do
  factory :user do
    name     "Mikhail Klishevich"
    email    "mih@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end