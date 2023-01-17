def process_refresh_token(request, response)
  url = 'https://github.com/login/oauth/access_token'
  data = {
    refresh_token: request.query['refresh_token'],
    grant_type: 'refresh_token',
    client_id: $client_id,
    client_secret: $client_secret
  }
  res = RestClient.post url,
    data,
    {
      accept: :json
    }

    render_json(res.body, response)
end
