FactoryGirl.define do
  
  factory :reservation do
    book
    state "free"
    email "library@eficode.com"
  end
  
end