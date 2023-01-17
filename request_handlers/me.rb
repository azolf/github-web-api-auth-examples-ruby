# frozen_string_literal: true

def process_me(_, response)
  result = File.read('templates/me.html')
  render_html(result, response)
end
