module Txns
  module Operation
    class Create < ApplicationOperation

      include Model
      model Txn, :create

      contract Contract::Create

      include Dispatch
      callback(:after_create) { on_change(:after_create) }

      def process(params)
        validate(params[:txn]) do |f|
          f.save
          dispatch! :after_create
        end
      end

      def after_create(form, **)
        ActiveRecord::Base.after_transaction do
          Txns::Callback::AfterCreateJob.perform_later(form.model)
        end
      end

    end
  end
end
