# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
#

Category.create(name: 'Electronics')
Category.create(name: 'Baby Care')
Category.create(name: 'Books')
Category.create(name: 'Kitchens')

Product.create(name: 'Apple Watch 7', description: 'Produced in 2020', quantity: 3, price: 8600.99, category_id: 1)
Product.create(name: 'Apple Watch 6', description: 'Produced in 2019', quantity: 5, price: 4500.99, category_id: 1)
Product.create(name: 'Apple Watch 5', description: 'Produced in 2016', quantity: 2, price: 2700.50, category_id: 1)
Product.create(name: 'iPhone 12', description: 'Produced in 2020', quantity: 78, price: 12700.50, category_id: 1)
Product.create(name: 'iPhone 10', description: 'Produced in 2018', quantity: 41, price: 7000.50, category_id: 1)
Product.create(name: 'iPhone 7', description: 'Produced in 2016', quantity: 23, price: 2300.50, category_id: 1)
Product.create(name: 'iPhone 6', description: 'Produced in 2014', quantity: 11, price: 3999.99, category_id: 1)



