module Txns
  module Operation
    class New < ApplicationOperation

      step Model(::Txn, :new)
      step self::Contract::Build(constant: Contract::Create)

    end
  end
end
