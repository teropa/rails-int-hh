module BooksHelper
  
  def query_by_radio_tag(field)
    checked = params[:by].blank? ? 
                    field.to_s == 'title' : params[:by] == field.to_s
    output = ""
    output << (radio_button_tag :by, field, checked)
    output << field.to_s.titleize
    content_tag(:span, raw(output))
  end
  
end
