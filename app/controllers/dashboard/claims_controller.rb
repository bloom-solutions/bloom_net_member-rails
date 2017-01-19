module Dashboard
  class ClaimsController < BaseController

    def new
      form Claims::Operation::Create
    end

    def create
      run Claims::Operation::Create do |op|
        return redirect_to(dashboard_path(op.model))
      end

      render action: :new
    end

    def show
      present Claims::Operation::Show
    end

  end
end
