require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

get "/" do #root home
  @restaurants = Restaurant.all
  erb :index
end

get "/restaurants/:id" do #voir 1 restaurant et ses details
  # params.to_s # pour voir le restaurants, ca rend {'id' => '1'}
  @restaurant = Restaurant.find(params[:id])
  erb :show #pour rendre la view Show
end

post '/restaurants' do # create a new restaurant
  name = params[:name] #pour recuperer le nom du restaurant envoye dans le form
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect '/'
end

# As a user I can list all the restaurants OK
# As a user I can see one restaurant's details  OK
# As a user I can add a restaurant  NEW  OK


# GET (read) PATCH (update) DELETE POST(create)
