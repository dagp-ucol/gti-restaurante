json.extract! ingredient, :id, :name, :quantity, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
