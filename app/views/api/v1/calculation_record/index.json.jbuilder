json.array!(@records) do |record|
  json.extract! record, :id, :name
  # json.slots do
  #   json.array!(record.recent_slots) do |slot|
  #     json.extract! slot, :id, :time, :remaining_seats
  #   end
  # end
  # json.small_image product.cover.url(:small)
end
