require 'csv'

#csv_data = CSV.read("db/list_person_all_utf8e.csv", headers: true)
csv_data = CSV.read("db/merge0725.csv", headers: true)
csv_data.each do |data|
  Book.create!(data.to_hash)
end

User.create!(name:  "AdminUser",
             email: "example@exampleqdokuhon.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

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
