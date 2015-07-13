json.array!(@schools) do |school|
  json.extract! school, :id, :name, :address, :phone, :website, :latitude, :longitude, :description
  json.url school_url(school, format: :json)
end
