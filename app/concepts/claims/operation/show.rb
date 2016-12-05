module Claims
  module Operation
    class Show < ApplicationOperation

      include Model
      model Claim, :find

    end
  end
end
