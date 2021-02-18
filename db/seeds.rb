puts "clearing db..."

puts "creating seed db..."

require "open-uri"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
objs = JSON.parse(json)

objs["drinks"].each do |key|
  ingredient = Ingredient.create(
    name: "#{key["strIngredient1"]}"
    )
  puts "#{ingredient.name} created!"
end
