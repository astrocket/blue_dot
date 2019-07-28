csv_string = File.read("lib/data/worldcities.csv")

CSV.parse(csv_string, headers: true).each do |row|
  next if City.find_by(name: row[:name]).present?
  City.create!(row.to_hash)
end
