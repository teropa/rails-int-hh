require 'test_helper'

class BookTest < ActiveSupport::TestCase
  
  context "book instance" do
    
    setup do
      @book = Factory(:book)
    end

    should validate_presence_of   :title
    should validate_uniqueness_of :title
    should validate_presence_of   :authors
    
    should validate_presence_of(:isbn).with_message(/is not a valid ISBN/)
    should_not allow_value("ldsfkfjasdfklp").for(:isbn)
    
    should "be valid with all attributes" do
      assert @book.valid?
    end
    
  end
  

end
