json.array!(@schools) do |school|
  json.extract! school, :id, :name, :address, :phone, :website
  json.url school_url(school, format: :json)
end
