module RemoteTxns
  module Operation
    class Show < ApplicationOperation

      step :find_model!

      private

      def find_model!(options, params:, **)
        tracking_no = params[:query]
        response = center_client.find_txn(tracking_no)
        options["model"] = response.success? ? response.txn : nil
      end

      def center_client
        BloomNetCenter::InitializeClient.execute.center_client
      end

    end
  end
end
