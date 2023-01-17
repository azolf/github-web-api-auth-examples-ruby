# frozen_string_literal: true

def process_callback(request, response)
  state_cookie = request.cookies.select { |c| c.name == 'github_auth_state' }.first
  raise 'error' unless state_cookie.value == request.query['state']

  data = {
    code: request.query['code'],
    redirect_uri: $callback_url,
    client_id: $client_id,
    client_secret: $client_secret
  }

  res = RestClient.post(
    'https://github.com/login/oauth/access_token',
    data,
    {
      accept: :json
    }
  )

  result = JSON.parse(res.body)

  params = {
    access_token: result['access_token'],
    refresh_token: result['refresh_token']
  }
  uri = URI('/me')
  uri.query = URI.encode_www_form(params)

  response.set_redirect(WEBrick::HTTPStatus::TemporaryRedirect, uri.to_s)
end
