module Dashboard
  class TxnsController < BaseController

    def new
      run Txns::Operation::New
    end

    def create
      run(Txns::Operation::Create) do |result|
        return redirect_to(dashboard_txn_path(result["model"]))
      end

      render :new
    end

    def show
      run Txns::Operation::Show
    end

  end
end
