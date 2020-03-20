FactoryBot.define do
    factory :user do |f|
        f.sequence(:name) { |n| "Test User #{n}" }
        f.sequence(:email) { |n| "test#{n}@example.com" }
        f.password {"password" }
        f.password_confirmation { |d| d.password }
    end
    
    factory :shop do |f|
        f.sequence(:product_name) { |n| "Product #{n}" }
        f.sequence(:price) { 1.0 }
        f.sequence(:quantity) { 1 }
        f.sequence(:information) { |n| "Product #{n} is very good" }
        f.sequence(:productImage) { Rack::Test::UploadedFile.new(Rails.root.join('test/support/test_image.jpg'), 'image/jpeg') }
        f.association :user
    end
end