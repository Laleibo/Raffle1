json.array!(@raffles) do |raffle|
  json.extract! raffle, :id, :title, :description, :prize
  json.url raffle_url(raffle, format: :json)
end
