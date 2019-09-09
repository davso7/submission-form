json.extract! form, :id, :nombre, :apellidos, :cedula, :email, :telefono, :institucion, :cargo, :profesion, :user_id, :created_at, :updated_at
json.url form_url(form, format: :json)
