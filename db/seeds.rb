# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

#Sound.delete_all

#Sound.create(:location => '121.47,31.23', :description => '', :path => 'sounds/0.mp3', :title => "Shanghai", :username => 'Susen')
#Sound.create(:location => '72.82,18.96', :description => '', :path => 'sounds/1.mp3', :title => "Bombay", :username => 'Xiaolong')
#Sound.create(:location => '67.01,24.86', :description => '', :path => 'sounds/2.mp3', :title => "Karachi", :username => 'Chen')
#Sound.create(:location => '-58.37,-34.61', :description => '', :path => 'sounds/3.mp3', :title => "Buenos Aires", :username => 'Devdeep')
#Sound.create(:location => '77.21,28.67', :description => '', :path => 'sounds/4.mp3', :title => "Delhi", :username => 'Mary')
#Sound.create(:location => '29,41.1', :description => '', :path => 'sounds/5.mp3', :title => "Istanbul", :username => 'Alex')
#Sound.create(:location => '120.97,14.62', :description => '', :path => 'sounds/6.mp3', :title => "Manila", :username => 'Max')

10.times do
  Sound.create(:location => '121.47,31.23', :description => '', :path => 'sounds/0.mp3', :title => "Shanghai", :user_id => 1)
end
