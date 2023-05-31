FactoryBot.define do
  factory :car do
    name { 'Tesla Model S' }
    description do
      'The Tesla Model S is an all-electric luxury sedan. It features a sleek design, ' \
        'advanced autopilot capabilities, and impressive acceleration. With its cutting-edge ' \
        'technology and long-range battery, the Model S offers a premium driving experience ' \
        'with zero emissions.'
    end
    model { 'Luxury Sedan' }
    rent_per_day { 30 }
    price { 89.990 }
    association :user, factory: :user
  end
end
