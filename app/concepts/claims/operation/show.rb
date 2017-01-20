module Claims
  module Operation
    class Show < ApplicationOperation

      step Model(Claim, :find)

    end
  end
end
