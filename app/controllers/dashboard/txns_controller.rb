module Dashboard
  class TxnsController < ApplicationController

    def new
      form Txns::Operation::Create
    end

    def create
      run Txns::Operation::Create do |op|
        return redirect_to(dashboard_path(op.model))
      end

      render action: :new
    end

    def show
      present Txns::Operation::Show
    end

  end
end
