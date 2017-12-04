json.extract! job, :id, :name, :description, :begin_date_time, :end_date_time, :created_at, :updated_at, :location , :hour_rate , :profile_id 
json.url job_url(job, format: :json)
