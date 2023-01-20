RubyOuath.configure do |c|
  c.scopes = %w[].join(' ')
  c.client_id = ENV['CLIENT_ID']
  c.client_secret = ENV['CLIENT_SECRET']
  c.provider = 'Github'
end