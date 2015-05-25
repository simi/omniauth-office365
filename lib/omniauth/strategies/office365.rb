require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Office365 < OmniAuth::Strategies::OAuth2
      option :name, :office365

      option :client_options, {
        site:          'https://outlook.office365.com/',
        token_url:     'https://login.windows.net/common/oauth2/token',
        authorize_url: 'https://login.windows.net/common/oauth2/authorize'
      }

      option :authorize_params, {
        resource: 'https://graph.windows.net/'
      }

      uid { raw_info["objectId"] }

      info do
        {
          'email' => raw_info["userPrincipalName"],
          'name' => [raw_info["givenName"], raw_info["surname"]].join(' '),
          'nickname' => raw_info["displayName"]
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get(authorize_params.resource + 'Me?api-version=1.5').parsed
      end
    end
  end
end
