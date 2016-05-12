json.array!(@shows) do |show|
  json.extract! show, :id, :venue, :venue_website, :date, :time
  json.url show_url(show, format: :json)
end
