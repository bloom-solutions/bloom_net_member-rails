module Dashboard
  class HomeController < ApplicationController

    def index
      @txns = Txn.order(created_at: :desc).limit(5)
      @claims = Claim.order(created_at: :desc).limit(5)
    end

  end
end
