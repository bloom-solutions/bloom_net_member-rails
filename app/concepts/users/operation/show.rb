module Users
  module Operation
    class Show < ApplicationOperation

      step :set_model!

      private

      def set_model!(options)
        options["model"] = options["current_user"]
      end

    end
  end
end
