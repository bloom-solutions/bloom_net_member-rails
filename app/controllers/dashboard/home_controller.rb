module Dashboard
  class HomeController < BaseController

    def index
      @txns = Txn.order(created_at: :desc).limit(5)
      @claims = Claim.order(created_at: :desc).limit(5)
    end

  end
end
