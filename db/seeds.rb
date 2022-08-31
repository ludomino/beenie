# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Plant.destroy_all

category_1 = Category.create(name: "Asparagaceae")
category_2 = Category.create(name: "Cactaceae")
category_3 = Category.create(name: "Dypsis lutescens")

images = [
  "https://apps.rhs.org.uk/plantselectorimages/detail/visi41580.jpg",
  "https://apps.rhs.org.uk/plantselectorimages/detail/WSY0042739_4458.jpg",
  "https://apps.rhs.org.uk/plantselectorimages/detail/visi135857.jpg",
  "https://apps.rhs.org.uk/plantselectorimages/detail/gymnocalycium%20baldianum%20-%20side%201.jpg",
  "https://apps.rhs.org.uk/plantselectorimages/detail/visi50117.jpg"
]

plants = []

plants << Plant.create(category: category_1, name: "Agave americana 'Marginata'", description: "A large, evergreen succulent plant forming a stiff rosette of greyish green, yellow-margined leaves. The leaves are armed with hard spines along the margins and at the tip. Mature plants may produce a tall (2m) branched spike of yellow flowers. Makes a striking patio container plant but requires winter protection", advice: "Grow under glass in cactus compost, water freely when in growth, but keep almost dry over winter. Apply a dilute, liquid fertiliser 3 or 4 times during the growing season. Agaves are monocarpic and the main rosette will die after producing a very tall (2m) flower spike, however new offsets are produced at the base of the old rosette.")
plants << Plant.create(category: category_2, name: "Echinopsis oxygona", description: "E. oxygona is a cactus with clustered, globose to shortly cylindrical, ribbed stems to 20cm tall, bearing short, blackish spines and funnel-shaped white flowers to 20cm across, opening in late afternoon", advice: "Grow under glass in a loam-based potting compost with added extra grit. Water moderately when in growth, sparingly when dormant. Apply a balanced liquid fertiliser 2 or 3 times in the growing season")
plants << Plant.create(category: category_2, name: "Espostoa lanata", description: "A columnar cactus with 20- to 30-ribbed stems, densely clothed in a white wool. In its native Peru it may reach 6m tall, but will only attain a fraction of that when grown as a pot plant", advice: "Grow in cactus compost in a sunny position. Water moderately during the growing season and keep almost dry in winter.")
plants << Plant.create(category: category_2, name: "Gymnocalycium baldianum", description: "G. baldianum is a cactus with solitary, flattened-globose stems with 9-11 tubercled ribs and bristle-like radial spines. Funnel-shaped flowers 4cm across are deep pink to crimson in summer", advice: "Grow under glass in a standard cactus compost, in bright, filtered light, with good ventilation. When in growth water moderately and feed every two or three weeks with a balanced liquid feed. Keep almost dry in the winter")
plants << Plant.create(category: category_3, name: "Dypsis lutescens", description: "D. lutescens is an evergreen palm forming a cluster of erect stems to 8m in height, bearing arching pinnate leaves to 2m in length, with linear leaflets, and panicles of small yellow flowers in summer", advice: "Grow under glass in a loam-based potting compost in bright indirect light. Water freely when in growth and apply a balanced liquid fertiliser two or three times during the growing season. Water sparingly in winter")

plants.each_with_index do |plant, index|
  file = URI.open(images[index])
  plant.image.attach(io: file, filename: "plant#{index}.png", content_type: "image/png")
  plant.save
  puts plant
end
