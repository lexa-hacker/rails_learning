# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

p "Creating companies"
100.times do |i|
  date = Date.new(1900+i)
  desc = "This is a company number #{i} which produce since #{date}"
  Company.create(name: "Company №#{i}", foundation: date, description: desc)
end

companies = Company.all

companies.each do |c|
  100.times do |i|
    Product.create(company_id: c.id, name: "Product #{c.id}:#{i}", price: rand(10000), description: "Product №#{i} of company #{c.name}")
  end
end