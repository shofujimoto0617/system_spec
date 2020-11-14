FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'RSpec & CapybaraBot を準備する' }
    association :user, factory: :admin_user
  end
end
