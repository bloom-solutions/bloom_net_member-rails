module IntegrationData
  module Cell
    class Show < ApplicationCell

      property :data

      def row
        render :row
      end

    end
  end
end
