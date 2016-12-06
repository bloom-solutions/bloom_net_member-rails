module Dashboard
  class HomeController < ApplicationController

    def index
      @txn = Txn.new
    end

  end
end
