module Dashboard
  class TxnsController < ApplicationController

    def new
      form Txns::Operation::Create
    end

  end
end
