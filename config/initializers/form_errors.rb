ActionView::Base.field_error_proc = proc do |html_tag, instance|
  html_doc = Nokogiri::HTML::DocumentFragment.parse(html_tag, Encoding::UTF_8.to_s)
  element = html_doc.children[0]

  if element
    element.add_class('border-red-500 focus:ring-red-600 focus:border-red-600')

    if %w[input select textarea select].include? element.name
      instance.raw "#{html_doc.to_html} <p class=\"text-red-500\">#{instance.error_message.join(', ').humanize}</p>"
    else
      instance.raw html_doc.to_html
    end
  else
    html_tag
  end
end
