# require 'sinatra'


#  set :bind, '0.0.0.0'
#  set :port, 4567

# get '/' do

#  'Thanks my friends !'

#  
require 'sinatra'
require 'sinatra/activerecord'
require './models/item'

set :database, {adapter: "sqlite3", database: "db/development.sqlite3"}

# Home
get '/' do
  @items = Item.all
  erb :index
end

# New
get '/items/new' do
  erb :new
end

# Create
post '/items' do
  Item.create(name: params[:name], description: params[:description])
  redirect '/'
end

# Show
get '/items/:id' do
  @item = Item.find(params[:id])
  erb :show
end

# Edit
get '/items/:id/edit' do
  @item = Item.find(params[:id])
  erb :edit
end

# Update
put '/items/:id' do
  item = Item.find(params[:id])
  item.update(name: params[:name], description: params[:description])
  redirect '/'
end

# Delete
delete '/items/:id' do
  Item.find(params[:id]).destroy
  redirect '/'
end
