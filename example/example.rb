$:.push File.dirname(__FILE__) + '/../lib'

require 'omniauth-office365'
require 'sinatra'


office365_client_id = 'PROVIDE'
office365_client_secret = 'ME'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :office365, office365_client_id, office365_client_secret
end

get '/' do
  "<a href='/auth/office365'>Log in with Office365</a>"
end

get '/auth/office365/callback' do
  content_type 'text/plain'
  request.env['omniauth.auth'].inspect
end

get '/auth/failure' do
  content_type 'text/plain'
  params.inspect
end
