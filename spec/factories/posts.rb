FactoryBot.define do
  factory :post do
    select_id       { 2 }
    vs_soldier_id   { 2 }
    vs_wizard_id    { 1 }
    vs_monk_id      { 0 }
    vs_fighter_id   { -1 }
    vs_gunner_id    { -2 }
    user_id         { 2 }
    association :user
  end
end
