require 'csv'

#csv_data = CSV.read("db/list_person_all_utf8e.csv", headers: true)
csv_data = CSV.read("db/merge.csv", headers: true)
csv_data.each do |data|
  Book.create!(data.to_hash)
end

10.times do |index|
  n = index + 1
  user = User.create(
    name: "user_#{n}",
    email: "example_#{n}@example.com",
    password: "password#{n}",
    password_confirmation: "password#{n}",
  )
  user.save!
end
