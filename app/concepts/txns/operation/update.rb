module Txns
  module Operation
    class Update < ApplicationOperation

      step Wrap(active_record_transaction) {
        step :find_model!
        step self::Contract::Build(constant: Contract::Update)
        step self::Contract::Validate(key: "txn")
        step self::Contract::Persist()
        failure :log_error!
      }
      step :enqueue_after_update_job!

      private

      def find_model!(options, params:, **args)
        options["model"] = options["txn"] || ::Txn.find(params["id"])
      end

      def log_error!(options, params:, **args)
      end

      def enqueue_after_update_job!(options)
        ActiveRecord::Base.after_transaction do
          Txns::Callback::AfterUpdateJob.perform_later(options["model"])
        end
      end

    end
  end
end
