class Careers::AccountsController < CareersController
  def show
    @account = Account.find(params[:id])
  end
end
