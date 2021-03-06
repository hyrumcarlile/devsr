module ApplicationHelper
  def markdown(text)
    options = {}

    extensions = {}

    text = ::Algorithms.format_code(text)
    
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    text = markdown.render(text).gsub('<em>', '_').gsub('</em>', '_').html_safe
  end
end
