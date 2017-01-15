# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

url_path = ''
entity_parent_id = 0
5.times do |i|
  url_path="#{url_path}#{i}/"
  Entity.create(name:i ,title:"title_#{i}", text:"text for #{i}",entity_id:entity_parent_id,order_number:i,url_path:url_path)
  entity_parent_id=Entity.last[:id]
end
