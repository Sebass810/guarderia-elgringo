json.extract! reservation, :id, :client_id, :box_id, :fecha_desde, :fecha_hasta, :estado, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
