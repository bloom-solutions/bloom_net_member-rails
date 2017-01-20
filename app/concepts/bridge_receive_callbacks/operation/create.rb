module BridgeReceiveCallbacks
  module Operation
    class Create < ApplicationOperation

      step :find_model!
      step :model_exists?, pass_fast: true
      step Model(BridgeReceiveCallback, :new)
      step self::Contract::Build(constant: Contract::Create)
      step self::Contract::Validate()
      step self::Contract::Persist()
      step :enqueue_after_create_job!

      private

      def find_model!(options, params:, **)
        options["model"] = BridgeReceiveCallback.find_by(external_id: params[:id])
      end

      def model_exists?(options)
        options["model"].present?
      end

      def enqueue_after_create_job!(options)
        ActiveRecord::Base.after_transaction do
          Callback::AfterCreateJob.perform_later(options[:model])
        end
      end

    end
  end
end
