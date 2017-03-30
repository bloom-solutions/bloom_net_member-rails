module Dashboard
  module Contract
    class Search < ApplicationContract

      property :query, virtual: true, empty: true

      # https://github.com/trailblazer/reform/issues/54
      def initialize
        super OpenStruct.new
      end

    end
  end
end
