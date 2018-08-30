json.extract! user_home_setting, :id, :home_widget_id, :user_id, :position, :visibility, :created_at, :updated_at
json.url user_home_setting_url(user_home_setting, format: :json)
