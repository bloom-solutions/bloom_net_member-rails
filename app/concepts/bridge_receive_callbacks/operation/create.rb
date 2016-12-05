module BridgeReceiveCallbacks
  module Operation
    class Create < ApplicationOperation

      include Model
      model BridgeReceiveCallback, :create

      contract Contract::Create

      include Dispatch
      callback(:after_create) { on_change(:after_create) }

      def process(params)
        if brc = BridgeReceiveCallback.find_by(external_id: params[:id])
          return brc
        end

        validate(params) do |f|
          if f.save
            dispatch! :after_create
          end
        end
      end

      private

      def after_create(form, **)
        ActiveRecord::Base.after_transaction do
          Callback::AfterCreateJob.perform_later(form.model)
        end
      end

    end
  end
end
