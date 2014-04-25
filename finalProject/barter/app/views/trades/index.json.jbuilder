json.array!(@trades) do |trade|
  json.extract! trade, :id, :user1, :user2, :user1_item, :user2_item, :status, :description
  json.url trade_url(trade, format: :json)
end
