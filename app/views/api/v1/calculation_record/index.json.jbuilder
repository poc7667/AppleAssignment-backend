json.array!(@records) do |record|
  json.extract! record, :id, :input, :result, :path
end
