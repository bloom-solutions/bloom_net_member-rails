module Claims
  module Cell
    class New < ApplicationCell

      def tracking_no
        context[:tracking_no]
      end

    end
  end
end

