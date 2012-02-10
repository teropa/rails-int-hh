class IsbnValidator
  VALID_CHARACTERS = ['0', '1', '2', '3', '4', '5',
                      '6', '7', '8', '9', '0', 'x']
  
  attr_reader :isbn
  
  # This is a comment
  def initialize(isbn)
    if isbn.nil?
      @isbn = ""
    else
      @isbn = cleanup_isbn(isbn)
    end
  end
  
  def valid?
    if @isbn.size == 10 || @isbn.size == 13
      @isbn.chars.all? { |c| valid_character?(c) }
    else
      return false
    end
  end
  
  private
  
  def valid_character?(c)
    return VALID_CHARACTERS.include?(c)
  end
  
  def cleanup_isbn(isbn)
    isbn.downcase.gsub(/-| /, "")
  end  
  
end