module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code,lexer: language)
    end
  end
  def markdown(content)
    renderer = HTMLwithPygments.new(hard_warp: true, filter_html: true)
    options = {
      autolinks: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      quote: true,
      footnotes: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end
