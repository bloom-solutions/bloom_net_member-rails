module Dashboard
  class HomeController < ApplicationController

    def index
      @txn = Txn.new
      @claim = Claim.new
    end

  end
end
