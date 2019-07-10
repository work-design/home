module ApplicationHelper

  def ex_simple_format(text, html_options={}, options={})
    text = '' if text.nil?
    text = text.dup
    start_tag = tag('p', html_options, true)
    text = sanitize(text) unless options[:sanitize] == false
    text = text.to_str
    text.gsub!(/\r\n?/, "</p>\n#{start_tag}")
    text.insert 0, start_tag
    text.html_safe.safe_concat("</p>")
  end

end
