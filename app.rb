require 'sinatra' 
require 'sinatra/contrib/all' 
require_relative 'controller/adoptions_controller'
require_relative 'controller/animals_controller'
require_relative 'controller/owners_controller'

get'/' do
  erb(:index)
end