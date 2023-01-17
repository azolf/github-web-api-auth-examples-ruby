# frozen_string_literal: true

def render_html(body, response)
  response.status = 200
  response['Content-Type'] = 'text/html'
  response.body = body
end

def render_json(body, response)
  response.status = 200
  response['Content-Type'] = 'application/json'
  response.body = body
end
