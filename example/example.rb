$:.push File.dirname(__FILE__) + '/../lib'

require 'omniauth-office365'
require 'sinatra'
require 'json'

set :port, 4200

office365_client_id = ENV['OFFICE365_CLIENT_ID']
office365_client_secret = ENV['OFFICE365_CLIENT_SECRET']

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :office365, office365_client_id, office365_client_secret
end

get '/' do
  "<a href='/auth/office365'>Log in with Office365</a>"
end

get '/auth/office365/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].to_json
end

get '/auth/failure' do
  content_type 'text/plain'
  params.to_json
end
