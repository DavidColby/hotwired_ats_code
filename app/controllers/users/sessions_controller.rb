class Users::SessionsController < Devise::SessionsController
  def destroy
    super do
      return redirect_to root_path
    end
  end
end
