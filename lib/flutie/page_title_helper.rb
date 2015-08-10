module PageTitleHelper
  def page_title(options = {})
    app_name = options[:app_name] || Rails.application.class.to_s.split('::').first
    page_title_symbol = options[:page_title_symbol] || :page_title
    separator = options[:separator] || ' : '
    reverse = options[:reverse] || false

    if content_for?(page_title_symbol)
      if reverse
        [content_for(page_title_symbol), app_name].join(separator)
      else
        [app_name, content_for(page_title_symbol)].join(separator)
      end
    else
      app_name
    end
  end
end
