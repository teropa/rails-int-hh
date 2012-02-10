class Book < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: true
  validates :authors, presence: true
  
  validates_with IsbnValidator

  
end
