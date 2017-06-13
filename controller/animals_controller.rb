require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/animal'

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

get '/animals/new' do
  @animals = Animal.all()
  erb(:"animals/new")
end

get '/animals/:id' do
  @animal = Animal.find(params[:id])
  erb(:"animals/show")
end

post '/animals' do
  animal = Animal.new(params)
  animal.save()
  redirect to ("/animals")
end 

get '/animals/:id/edit' do
  @animal = Animal.find(params[:id])
  erb(:"animals/edit")
end

get '/filter_by_type' do
  @animals = Animal.find_type(params[:animal_type])
  erb(:"/animals/filter_by_type")
end

post '/animals/:id/delete' do
  Animal.delete(params[:id])
  redirect to ("/animals")
end
