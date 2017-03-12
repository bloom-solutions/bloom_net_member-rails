module Dashboard
  class BaseController < ApplicationController

    before_action :authenticate_user!

    protected

    def _run_options(options)
      options.merge("current_user" => current_user )
    end

  end
end
