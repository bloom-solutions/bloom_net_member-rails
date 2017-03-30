module Dashboard
  module Cell
    class OutboundStats < ApplicationCell

      private

      def today_count
        Txn.created_on(Date.today).count
      end

    end
  end
end
