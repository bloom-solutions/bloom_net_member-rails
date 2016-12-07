module Dashboard
  module Cell
    class Stats < ApplicationCell

      private

      def outbound_today_count
        Txn.created_on(Date.today).count
      end

      def inbound_today_count
        Claim.created_on(Date.today).count
      end

    end
  end
end
