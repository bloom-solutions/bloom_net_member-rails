module Txns
  module Operation
    class Create < ApplicationOperation

      step Wrap(active_record_transaction) {
        step Model(::Txn, :new)
        step self::Contract::Build(constant: Contract::Create)
        step self::Contract::Validate(key: "txn")
        step self::Contract::Persist()
        failure :log_error!
      }
      step :enqueue_after_create_job!

      private

      def log_error!(options, params:, **args)
      end

      def enqueue_after_create_job!(options)
        ActiveRecord::Base.after_transaction do
          Txns::Callback::AfterCreateJob.perform_later(options["model"])
        end
      end

    end
  end
end
