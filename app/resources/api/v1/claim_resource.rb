module Api
  module V1
    class ClaimResource < JSONAPI::Resource

      after_create :enqueue_job

      primary_key :ref_no
      key_type :string

      attributes(*%i[
        ref_no
        status
      ])

      def self.creatable_fields(context)
        super - %i[status]
      end

      private

      def enqueue_job
        ActiveRecord::Base.after_transaction do
          Claims::Callback::AfterCreateJob.perform_later(@model)
        end
      end

    end
  end
end
