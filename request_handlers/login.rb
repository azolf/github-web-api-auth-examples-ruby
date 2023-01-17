# frozen_string_literal: true

def process_login(_, response)
  random_string = SecureRandom.hex
  response.cookies.push WEBrick::Cookie.new('github_auth_state', random_string)

  params = {
    response_type: 'code',
    client_id: $client_id,
    scope: $scopes,
    redirect_uri: $callback_url,
    state: random_string
  }
  uri = URI('https://github.com/login/oauth/authorize')
  uri.query = URI.encode_www_form(params)

  response.set_redirect(WEBrick::HTTPStatus::TemporaryRedirect, uri.to_s)
end
