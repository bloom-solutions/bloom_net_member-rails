module Txns
  module Operation
    class Show < ApplicationOperation

      include Model
      model Txn, :find

    end
  end
end
