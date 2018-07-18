module ApplicationHelper
  def markdown(text)
    options = {}

    extensions = {}

    text = ::Algorithms.format_code(text)
    
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
