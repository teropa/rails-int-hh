require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  
  context "book instance" do
    
    setup do
      @reservation = Factory(:reservation)
    end

    
	subject do
   
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:book, state => "free") }
	it { should validates_format_of :email, :with => (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).with_message(/is not a valid email/) }

	it {should_not_allow_values_for :email, "abc", "!s@abc.com", "a@!d.com", "a@a.c0m"}
    it {should_allow_values_for :email, "example@example.com", "1a@a.com", "a@2a.net"}
    it { should validate_presence_of(:book_id) }
    should_not allow_value("reserved").for(:book, state)
    
    should "be valid with all attributes" do
      assert @reservation.valid?
	  
	  end
	  
    end
    
  end
  

end
