json.array!(@topics) do |topic|
  json.extract! topic, :id, :topic
  json.url topic_url(topic, format: :json)
end
