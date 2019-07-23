require 'csv'

csv_data = CSV.read("db/list_person_all_utf8e.csv", headers: true)
csv_data.each do |data|
  Book.create!(data.to_hash)
end
