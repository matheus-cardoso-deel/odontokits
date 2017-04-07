json.array!(@kits) do |kit|
  json.extract! kit, :id, :nome, :aluno_id, :created_at, :updated_at
  json.url kit_url(kit, format: :json)
end
