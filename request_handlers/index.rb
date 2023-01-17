# frozen_string_literal: true

def process_(_, response)
  result = File.read('templates/index.html')
  render_html(result, response)
end
