Album.destroy_all
50.times do |index|
 Album.create!(name: Faker::Music.album, year: Faker::Number.between(from: 1900, to: 2019))
end

p "Created #{Album.count} albums"
