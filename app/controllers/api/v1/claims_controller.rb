module Api
  module V1
    class ClaimsController < BaseController

      include JSONAPI::ActsAsResourceController

      before_action :validate_signature

      private

      def validate_signature
        authorization_extractor = AuthorizationExtractor.
          new(request.headers["AUTHORIZATION"])
        api_token = ApiToken.find_by(token: authorization_extractor.token)

        unless ValidateSignature.(
            secret: api_token.secret,
            signature: authorization_extractor.signature,
            body: request.body.read,
        )
          render json: {error: "Unauthorized"}, status: 401
        end
      end

    end
  end
end
