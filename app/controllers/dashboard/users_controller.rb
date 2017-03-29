module Dashboard
  class UsersController < BaseController

    def show
      run Users::Operation::Show
    end

  end
end
