module Api
  module V1
    class BridgeController < BaseController

      def receive
        Rails.logger.info "GOT something #{params.inspect}"
        run BridgeReceiveCallbacks::Operation::Create do |op|
          return render plain: "OK", status: 200
        end

        render plain: "ERROR", status: 406
      end

    end
  end
end
