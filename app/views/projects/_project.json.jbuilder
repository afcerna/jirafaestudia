json.extract! project, :id, :name, :description, :total_hours_to_finish, :worked_hours, :created_at, :updated_at
json.url project_url(project, format: :json)
