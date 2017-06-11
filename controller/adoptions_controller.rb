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

get 'adoption/new' do
  @animals = Animal.all()
  @owners = Owner.all()
  erb(:"adoptions/new")
end

post '/adoptions' do
  @adoptions = Adoption.new(params)
  @adoptions.save()
  redirect to("/adoptions")
end