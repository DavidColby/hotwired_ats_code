json.extract! job, :id, :title, :status, :job_type, :location, :account_id, :created_at, :updated_at
json.url job_url(job, format: :json)
