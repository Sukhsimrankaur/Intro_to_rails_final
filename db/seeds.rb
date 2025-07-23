# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

csv_path = Rails.root.join('db', 'data', 'mosquito_data.csv')

puts " Seeding mosquito data from #{csv_path}..."

csv = CSV.read(csv_path, headers: true)

csv.each_with_index do |row, index|
  date = row['Count Date']

  if date.blank?
    puts "  Skipping row #{index + 2} (missing date)"
    next
  end

  row.headers.each do |trap_name|
    next if trap_name == 'Count Date' || row[trap_name].blank?

    trap = MosquitoTrap.find_or_create_by!(name: trap_name)

    trap.mosquito_readings.create!(
      date: date,
      count: row[trap_name]
    )
  rescue ActiveRecord::RecordInvalid => e
    puts " Failed to create reading for trap #{trap_name} on row #{index + 2}: #{e.message}"
  end
end

puts " Seeding complete!"
