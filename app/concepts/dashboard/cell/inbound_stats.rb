module Dashboard
  module Cell
    class InboundStats < ApplicationCell

      private

      def today_count
        Claim.created_on(Date.today).count
      end


    end
  end
end
