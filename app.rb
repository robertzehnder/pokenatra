require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/pokemon'

get '/allPokemon' do
  @pokemon = Pokemon.all
  erb :viewAll
end

get '/newPokemon' do
  @pokemon = Pokemon.all
  erb :create
end

get '/allPokemon/edit/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :edit
end

put '/allPokemon/edit/:id' do
  Pokemon.update(
    name: params[:name],
    poke_type: params[:poke_type],
    cp: params[:cp],
    img_url: params[:img_url]
  )
  redirect '/allPokemon'
end

delete '/allPokemon/:id' do
  Pokemon.find(params[:id]).destroy
  redirect '/allPokemon'
end

post '/newPokemon' do
  Pokemon.create(
    name: params[:name],
    poke_type: params[:poke_type],
    cp: params[:cp],
    img_url: params[:img_url]
  )
  redirect '/allPokemon'
end
