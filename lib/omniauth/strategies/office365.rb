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

      uid { raw_info["MailboxGuid"] }

      info do
        {
          'email' => raw_info["Id"],
          'name' => raw_info["DisplayName"],
          'nickname' => raw_info["Alias"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/ews/odata/me').parsed
      end
    end
  end
end
