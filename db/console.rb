require_relative '../models/animal'
require_relative '../models/owner'
require_relative '../models/adoption'
require 'pry-byebug'

@animal1 = Animal.new({
  'name' => "Dougal",
  'age' => 3,
  'type' => "Dog",
  'breed' => "Daschund",
  'admission_date' => "17/02/2017",
  'adoptable' => true,
  'image_url' => "../uploads/Dougal.jpeg"
  })
@animal1.save()

@animal2 = Animal.new({
  'name' => "Tabitha",
  'age' => 17,
  'type' => "Cat",
  'breed' => "Manx",
  'admission_date' => "02/012/2016",
  'adoptable' => false,
  'image_url' => "../uploads/tabby.jpg"
  })
@animal2.save()

@animal3 = Animal.new({
  'name' => "Ghost",
  'age' => 3,
  'type' => "Dog",
  'breed' => "Husky",
  'admission_date' => "09/06/2017",
  'adoptable' => true,
  'image_url' => "../uploads/ghost.jpeg"
    })
@animal3.save()

@animal4 = Animal.new({
  'name' => "Roger",
  'age' => 9,
  'type' => "Rabbit",
  'breed' => "Lionhead",
  'admission_date' => "12/10/2016",
  'adoptable' => true,
  'image_url' => "../uploads/Lionhead.jpg"
  })
@animal4.save()

@animal5 = Animal.new({
  'name' => "Kaa",
  'age' => 4,
  'type' => "Snake",
  'breed' => "Indian Rock Python",
  'admission_date' => "20/05/2015",
  'adoptable' => true,
  'image_url' => "../uploads/kaa.jpg"
  })
@animal5.save()

@owner1 = Owner.new({
  'first_name' => "Graham",
  'second_name' => "Bruce",
  'address' => "105 Pittodrie Place, Aberdeen"
  })
@owner1.save()

@owner2 = Owner.new({
  'first_name' => "Meghan",
  'second_name' => "Wilson",
  'address' => "105 Pittodrie Place, Aberdeen"
  })
@owner2.save()

@owner3 = Owner.new({
  'first_name' => "Glenda",
  'second_name' => "Bruce",
  'address' => "22 John Street, Nairn"
  })
@owner3.save()

@owner4 = Owner.new({
  'first_name' => "Greg",
  'second_name' => "Davidson",
  'address' => "5 Abbott Crescent, glasgow"
  })

@owner4.save()

@owner5 = Owner.new({
  'first_name' => "Colin",
  'second_name' => "Bell",
  'address' => "2 Pinewood Avenue, Glasgow"
  })
@owner5.save()

adoption1 = Adoption.new({
  'animal_id' => @animal1.id,
  'owner_id' => @owner3.id
  })
adoption1.save()

adoption2 = Adoption.new({
  'animal_id' => @animal4.id,
  'owner_id' => @owner1.id
  })
adoption2.save()

adoption3 = Adoption.new({
  'animal_id' => @animal5.id,
  'owner_id' => @owner2.id
  })
adoption3.save()





