FactoryBot.define do
  factory :item do
    name { Faker::Name.initials(number:2) }
    text { '日本人' }
    price { 1000 }
    user_id { @user }
    genre_id { 1 }
    quality_id { 1 }
    payment_id { 1 }
    region_of_origin_id { 1 }
    delivery_day_id { 1 }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'images', 'sample_image.jpg'), 'image/jpeg') }
    association :user
  end
end
