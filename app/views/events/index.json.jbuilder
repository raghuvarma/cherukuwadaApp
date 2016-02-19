json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :event_on, :is_repeated
  json.url event_url(event, format: :json)
end
