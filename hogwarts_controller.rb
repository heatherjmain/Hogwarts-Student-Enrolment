require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/student.rb')
require_relative( './models/house.rb')

get '/home' do
  erb(:home)
end

# INDEX route
get '/students' do
  @students = Student.all()
  erb(:index)
end

# NEW route
get '/students/new' do
  @houses = House.all
  erb(:new)
end

# CREATE route
post '/students' do
  @students = Student.new(params)
  @students.save()
  redirect to ('/students')
end

# SHOW route
get '/students/:id' do
  @students = Student.find(params["id"])
  @house = House.find(@students.house_id).name
  erb(:show)
end

# DELETE route
post '/students/:id/delete' do
  @students = Student.find(params["id"])
  @students.delete()
  redirect to'/students'
end

# EDIT route
get '/students/:id/edit' do
  @houses = House.all
  @students = Student.find(params["id"])
  erb(:edit)
end

# UPDATE route
post "/students/:id" do
  @students = Student.new(params)
  @students.update()
  redirect to "/students/#{@students.id}"
end
