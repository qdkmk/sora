# frozen_string_literal: true

require 'csv'

# csv_data = CSV.read("db/list_person_all_utf8e.csv", headers: true)
csv_data = CSV.read('db/merge0725.csv', headers: true)
csv_data.each do |data|
  Book.create!(data.to_hash)
end

AdminUser = User.new(name: 'AdminUser',
                     email: 'example@exampleqdokuhon.org',
                     password: 'foobar',
                     password_confirmation: 'foobar',
                     admin: true)
AdminUser.skip_confirmation!
AdminUser.save!

10.times do |index|
  n = index + 1
  user = User.new(
    name: "user_#{n}",
    email: "example_#{n}@example.com",
    password: "password#{n}",
    password_confirmation: "password#{n}"
  )
  user.skip_confirmation!
  user.save!
end
