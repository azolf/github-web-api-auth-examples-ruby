# frozen_string_literal: true

require 'webrick'
require 'securerandom'
require 'rest-client'
require 'json'
require 'base64'

require_relative 'request_handler'
require_relative 'request_handlers/index'
require_relative 'helpers/response'
require_relative 'request_handlers/login'
require_relative 'request_handlers/callback'
require_relative 'request_handlers/me'
require_relative 'request_handlers/refresh_token'

$scopes = %w[].join(' ')

port = 8000

server = WEBrick::HTTPServer.new Port: port #

$client_id = ENV['CLIENT_ID']
$client_secret = ENV['CLIENT_SECRET']

$callback_url = "http://localhost:#{port}/callback"

server.mount '/', RequestHandler
server.mount '/assets', WEBrick::HTTPServlet::FileHandler, './assets'

trap 'INT' do server.shutdown end

server.start
