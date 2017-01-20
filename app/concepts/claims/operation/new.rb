module Claims
  module Operation
    class New < ApplicationOperation

      step Model(::Claim, :new)
      step self::Contract::Build(constant: Contract::Create)

    end
  end
end
