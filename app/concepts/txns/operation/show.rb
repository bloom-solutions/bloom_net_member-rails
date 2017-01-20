module Txns
  module Operation
    class Show < ApplicationOperation

      step Model(Txn, :find)

    end
  end
end
