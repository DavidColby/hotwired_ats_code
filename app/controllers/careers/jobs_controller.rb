class Careers::JobsController < CareersController
  before_action :set_account, only: %i[index]
  before_action :set_job, only: %i[show]

  def index
    @jobs = @account.jobs.open.order(title: :asc)
  end

  def show
    @account = @job.account
  end

  private

  def set_job
    @job = Job.includes(:account).find(params[:id])
  end

  def set_account
    @account = Account.find(params[:account_id])
  end
end
