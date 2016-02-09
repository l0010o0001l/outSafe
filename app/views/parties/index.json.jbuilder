json.array!(@parties) do |party|
  json.extract! party, :id, :references, :title, :address, :min_age
  json.url party_url(party, format: :json)
end
