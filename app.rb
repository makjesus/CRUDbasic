# app.rb
require 'sinatra'
require '.lib/db'

get '/' do
  'Hello, world!'
end
