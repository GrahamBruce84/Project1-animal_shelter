require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative '../models/adoption'
require_relative '../models/animal'
require_relative '../models/owner'

get '/adoptions' do
  @animals = Animal.all()
  @owners = Owner.all()
  @adoptions = Adoption.all()
  erb(:"adoptions/index")
end

get '/adoptions/new' do
  @animals = Animal.find_adoptable()
  @owners = Owner.all()
  erb(:"adoptions/new")
end

post '/adoptions' do
  @adoptions = Adoption.new(params)
  @adoptions.save()
  pet = Animal.find(params[:animal_id])
  pet.adoptable = false
  pet.update(params)
  redirect to("/adoptions")
end

