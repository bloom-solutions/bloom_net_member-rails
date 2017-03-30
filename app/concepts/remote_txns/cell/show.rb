module RemoteTxns
  module Cell
    class Show < ApplicationCell

      property :id
      property :status

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

