module ApplicationHelper
  
  def flash_class(name)
    if name == :notice
      "alert alert-success"
    elsif name == :error
      "alert alert-error"
    else
      "alert"
    end
  end
  
end
