json.extract! client, :id, :nombre, :apellido, :dni, :telefono, :celular, :estado, :created_at, :updated_at
json.url client_url(client, format: :json)
