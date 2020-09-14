# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new
u.name = 'mateo'
u.email = 'mateo@test.com'
u.save
u.name = 'pastor'
u.email = 'pastor@test.com'
u.save
u.name = 'pancho'
u.email = 'pancho@test.com'
u.save

e = Event.new
e.title = 'test event 1'
e.body = '1 from the test database'
e.location = 'microverse'
e.date = '2020-09-10'
e.creator_id = 1
e.save
e.title = 'test event 2'
e.body = '2 from the test database'
e.location = 'microverse'
e.date = '2020-09-15'
e.creator_id = 2
e.save

a = Attendance.new
a.user_id = 1
a.event_id = 1
a.save
