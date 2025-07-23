require 'csv'
require 'faker'

csv_path = Rails.root.join('db', 'data', 'mosquito_data.csv')
csv = CSV.read(csv_path, headers: true)

# Trap locations → set fake lat/lng for now
trap_locations = {}

trap_columns = csv.headers.reject { |h| h == "Count Date" || h == "City Wide Daily Average" || h == "Trap Days" }

trap_columns.each_with_index do |trap_name, i|
  trap_id = trap_name.parameterize.underscore.upcase  # e.g. "North West 1" -> "north_west_1" -> "NORTH_WEST_1"

  trap = MosquitoTrap.find_or_create_by!(
    trap_id: trap_id,
    name: trap_name,
    latitude: 49.8 + (i * 0.01),  # fake latitude
    longitude: -97.1 - (i * 0.01) # fake longitude
  )

  trap_locations[trap_name] = trap
end

csv.each do |row|
  date = Date.parse(row['Count Date'])

  trap_columns.each do |trap_name|
    count = row[trap_name].to_i
    trap = trap_locations[trap_name]

    trap.mosquito_readings.create(
      date: date,
      count: count
    )
  end
end

# Generate fake inspectors
20.times do
  inspector = Inspector.create(
    name: Faker::Name.name,
    specialty: Faker::Job.field
  )

  inspector.mosquito_traps << MosquitoTrap.order('RANDOM()').limit(3)
end
