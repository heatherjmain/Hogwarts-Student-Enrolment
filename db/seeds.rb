require('pry-byebug')
require_relative('../models/student')
require_relative('../models/house')


house1 = House.new({"name"=>"Gryffindor", "logo"=>"LOGO_1"})
house2 = House.new({"name"=>"Ravenclaw", "logo"=>"LOGO_2"})
house3 = House.new({"name"=>"Hufflepuff", "logo"=>"LOGO_3"})

house1.save()
house2.save()
house3.save()

student1 = Student.new({
  "first_name"=> "Harry",
  "second_name"=> "Potter",
  "house_id"=> 1,
  "age"=> 13
  })

student2 = Student.new({
  "first_name"=> "Ron",
  "second_name"=> "Weasley",
  "house_id"=> 1,
  "age"=> 14
  })

student3 = Student.new({
  "first_name"=> "Hermione",
  "second_name"=> "Granger",
  "house_id"=> 1,
  "age"=> 13
  })

student1.save()
student2.save()
student3.save()


binding.pry
nil