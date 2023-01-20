# frozen_string_literal: true

def process_callback(request, response)
  state_cookie = cookie(request, RubyOuath.configuration.cookie_name)
  raise 'error' unless state_cookie.value == request.query['state']
  result = RubyOuath::ProviderClient.get_token_by_code(request.query['code'])

  redirect_to('/me', {
    access_token: result['access_token'],
    refresh_token: result['refresh_token']
  }, response)
end
