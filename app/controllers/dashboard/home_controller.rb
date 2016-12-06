module Dashboard
  class HomeController < ApplicationController

    def index
      @txn = Txn.new
      @claim = Claim.new
      @txns = Txn.all
      @claims = Claim.all
    end

  end
end
