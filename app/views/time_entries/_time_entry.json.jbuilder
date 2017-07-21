json.extract! time_entry, :id, :number_of_hours, :date, :description, :Project_id, :created_at, :updated_at
json.url time_entry_url(time_entry, format: :json)
