module Claims
  module Cell
    class New < ApplicationCell

      def ref_no
        context[:ref_no]
      end

    end
  end
end

