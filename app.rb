# app.rb
require 'sinatra'
require 'sinatra/activerecord'
require 'require_all'

set :database_file, 'config/database.yml'

require_all 'models'

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension


  get '/' do
  @items = Item.all
  erb :index
end

get '/items/new' do
  erb :new
end

post '/items' do
  Item.create(params[:item])
  redirect '/'
end

get '/items/:id/edit' do
  @item = Item.find(params[:id])
  erb :edit
end

put '/items/:id' do
  item = Item.find(params[:id])
  item.update(params[:item])
  redirect '/'
end

delete '/items/:id' do
  Item.find(params[:id]).destroy
  redirect '/'
end
end

:end
