module HasSnippets
  extend ActiveSupport::Concern

  SNIPPET_REGEXP = /\{\{snippet:(.*?)\}\}/

  included do
    method_name = new.respond_to?(:content) ? :content : :body

    define_method("#{ method_name }_formated") do
      raw      = send(method_name)
      snippets = Snippet.where(name: raw.scan(SNIPPET_REGEXP).flatten)

      snippets.each do |snippet|
        raw.gsub!("{{snippet:#{ snippet.name }}}", snippet.text)
      end

      raw
    end
  end
end
