module Dashboard
  module Cell
    class SearchBar < ApplicationCell

      property :query

      def query_value
        context[:query]
      end

      private

      def model
        Contract::Search.new
      end

    end
  end
end
