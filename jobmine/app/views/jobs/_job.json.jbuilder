json.extract! job, :id, :name, :created_by_user, :description, :begin_date_time, :end_date_time, :created_at, :updated_at
json.url job_url(job, format: :json)
