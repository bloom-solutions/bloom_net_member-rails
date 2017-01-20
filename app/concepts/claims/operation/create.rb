module Claims
  module Operation
    class Create < ApplicationOperation

      step Model(Claim, :new)
      step self::Contract::Build(constant: Contract::Create)
      step self::Contract::Validate(key: "claim")
      step self::Contract::Persist()
      step :enqueue_after_create_job!

      def enqueue_after_create_job!(options)
        ActiveRecord::Base.after_transaction do
          Claims::Callback::AfterCreateJob.perform_later(options[:model])
        end
      end

    end
  end
end
