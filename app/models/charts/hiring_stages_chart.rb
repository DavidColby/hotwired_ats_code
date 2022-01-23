class Charts::HiringStagesChart
  def initialize(account_id, job_id = nil)
    @account_id = account_id
    @job_id = job_id
  end

  def generate
    query_data
  end

  def query_data
    Applicant
      .includes(:job)
      .for_account(@account_id)
      .for_job(@job_id)
      .group('stage')
      .count
  end
end
