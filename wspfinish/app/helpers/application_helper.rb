module ApplicationHelper



  def name_and_id_to_hash(models)
    arr = Array.new
    models.each do |model|
      arr.push(model.id, model.name)
    end
    Hash[*(arr)]
  end

  def full_title(page_title)
    base_title = "HUNGRY"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def content_width()
    if params[:smaller_width]
      "small-width padding-20px"
    else
      params[:padding] ? "normal-width padding-20px" : "normal-width"
    end
  end

  def input_helper(f, field, type, aster=false)
    error_messages = f.object.respond_to?(:errors) ? f.object.errors[field] : []
    if error_messages.empty?
      error_messages = ""
    else
      error_messages = error_messages.join(',')
    end

    render :partial => "helpers/input_helper",
           :locals => { f: f,
                        field: field,
                        type: type,
                        aster: aster,
                        error_messages: error_messages }
  end

  def radio_helper(f, field, name, options={})
    render :partial => "helpers/radio_helper",
           :locals => { f: f,
                        field: field,
                        name: name,
                        options: options}
  end

end
