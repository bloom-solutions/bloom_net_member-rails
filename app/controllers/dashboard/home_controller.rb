module Dashboard
  class HomeController < ApplicationController

    def index
      @txn = Txn.new
      @claim = Claim.new
      @txns = Txn.order(created_at: :desc).limit(5)
      @claims = Claim.order(created_at: :desc).limit(5)
    end

  end
end
