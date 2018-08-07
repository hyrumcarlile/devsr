class Algorithms
  class << self
    def format_code(text)
      code_start_occurences = text.scan(/```[a-z]+\r\n/)
      code_start_occurences.map{ |occurence| text = text.sub(occurence, "<pre><code class=\"language-#{occurence.gsub('`', '')}\">")}

      code_end_occurences = text.scan(/```/)
      code_end_occurences.map{ |occurence| text = text.sub(occurence, "</pre></code>") }

      text
    end

    def calculate_endorsement_value endorsement
        return 1
    end
  end
end