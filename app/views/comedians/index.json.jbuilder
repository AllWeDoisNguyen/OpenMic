json.array!(@comedians) do |comedian|
  json.extract! comedian, :id, :name, :username, :password
  json.url comedian_url(comedian, format: :json)
end
