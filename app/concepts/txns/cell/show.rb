module Txns
  module Cell
    class Show < ApplicationCell

      property :ref_no
      property :status
      property :sender_first_name
      property :sender_last_name
      property :sender_mobile
      property :sender_street
      property :sender_city
      property :sender_province
      property :sender_region
      property :recipient_first_name
      property :recipient_last_name
      property :recipient_mobile
      property :recipient_street
      property :recipient_city
      property :recipient_province
      property :recipient_region

      def row
        render :row
      end

      private

      def amount
        h.number_to_currency model.amount, unit: "₱"
      end

      def date
        model.created_at.in_time_zone("Singapore").
          strftime("%-m/%-d - %k:%M%P")
      end

      def sender_full_name
        [model.sender_last_name, model.sender_first_name].join(", ")
      end

      def recipient_full_name
        [model.recipient_last_name, model.recipient_first_name].join(", ")
      end

    end
  end
end

