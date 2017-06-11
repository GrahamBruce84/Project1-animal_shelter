require_relative '../models/animal'
require_relative '../models/owner'
require_relative '../models/adoption'
require 'pry-byebug'

@animal1 = Animal.new({
  'name' => "Dougal",
  'age' => 3,
  'type' => "Dog",
  'breed' => "Daschund",
  'admission_date' => "17/02/2017"
  })
@animal1.save()

@animal2 = Animal.new({
  'name' => "Tabitha",
  'age' => 17,
  'type' => "Cat",
  'breed' => "Manx",
  'admission_date' => "02/012/2016"
  })
@animal2.save()

@animal3 = Animal.new({
  'name' => "Marley",
  'age' => 7,
  'type' => "Dog",
  'breed' => "Labrador",
  'admission_date' => "09/06/2017"
  })
@animal3.save()

@animal4 = Animal.new({
  'name' => "Roger",
  'age' => 9,
  'type' => "Rabbit",
  'breed' => "Lionhead",
  'admission_date' => "12/10/2016"
  })
@animal4.save()

@animal5 = Animal.new({
  'name' => "Kaa",
  'age' => 4,
  'type' => "Snake",
  'breed' => "Indian Rock Python",
  'admission_date' => "20/05/2015"
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
  'first_name' => "Graham",
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
  'address' => "39 Joke Street, Glasgow"
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

# adoption4 = Adoption.new({
#   'animal_id' => animal2.id,
#   'owner_id' => owner4.id
#   })
# adoption4.save()

# adoption5 = Adoption.new({
#   'animal_id' => animal3.id,
#   'owner_id' => owner5.id
# })
# adoption5.save()

binding.pry
nil





