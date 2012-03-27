FactoryGirl.define do

  sequence :title do |n|
    "Book #{n}"
  end
  
  factory :book do
    title
    authors "Herman Hesse"
    isbn "978-0-9776-1663-3"
    description "Test description"
  end
  
end
