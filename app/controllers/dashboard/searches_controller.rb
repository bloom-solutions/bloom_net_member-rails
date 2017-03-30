module Dashboard
  class SearchesController < BaseController

    def show
      run RemoteTxns::Operation::Show
    end

  end
end
