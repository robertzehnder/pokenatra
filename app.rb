require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'
require_relative 'models/pokemon'
require_relative 'models/trainer'

#Home Page

  get '/' do
    erb :index
  end

#trainer routes

  #---View all trainers

    get '/trainers' do
      @trainers = Trainer.all
      erb :"trainer/viewAllTrainers"
    end

  #---View all pokemon of trainer

    get '/trainers/:id/pokemon' do
      @trainer = Trainer.find(params[:id])
      erb :"trainer/pokemon"
    end

  #---Edit Trainer

    get '/trainers/:id' do
      @trainer = Trainer.find(params[:id])
      erb :"trainer/editTrainers"
    end

    put '/trainers/:id' do
      @trainer = Trainer.find(params[:id])
      @trainer.update(
        name: params[:name],
        level: params[:level],
        img_url: params[:img_url]
      )
      redirect '/trainers'
    end

  #---Create Trainer

    get '/newTrainer' do
      @trainer = Trainer.all
      erb :"trainer/create"
    end

    post '/newTrainer' do
      Trainer.create(
        name: params[:name],
        level: params[:level],
        img_url: params[:img_url]
      )
      redirect '/trainers'
    end

  #---Delete Trainer

    delete '/trainers/:id' do
      Trainer.find(params[:id]).destroy
      redirect '/trainers'
    end

# Pokemon routes
    get '/allPokemon' do
      @pokemon = Pokemon.all
      erb :"pokemon/viewAll"
    end

    get '/allPokemon' do
      @pokemon = Pokemon.all
      erb :"pokemon/viewAll"
    end

    get '/newPokemon' do
      @pokemon = Pokemon.all
      erb :"pokemon/create"
    end

    get '/allPokemon/edit/:id' do
      @pokemon = Pokemon.find(params[:id])
      erb :"pokemon/edit"
    end

    put '/allPokemon/edit/:id' do
      @pokemon = Pokemon.find(params[:id])
      @pokemon.update(
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
