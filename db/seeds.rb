# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case Rails.env
when "development"
	User.create(:email => 'marcoarangco@gmail.com', :password => 'p@$$w0rd', :password_confirmation => 'p@$$w0rd', :username => 'administrator', :role => 'admin')
when "production"
	User.create(:email => ENV['GMAIL_USERNAME'], :password => ENV['GMAIL_PASSWORD'], :password_confirmation => ENV['GMAIL_PASSWORD'], :username => 'administrator', :role => 'admin')
end