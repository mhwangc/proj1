class PokemonsController < ApplicationController

	def capture
		poke_id = params[:id]
		poke = Pokemon.find(poke_id)
		poke.update(trainer_id: current_trainer.id)
		redirect_to root_path
	end

	def damage
		poke_id = params[:id]
		poke = Pokemon.find(poke_id)
		poke.update(health: poke.health - 10)
		trainer_id = poke.trainer_id
		if poke.health <= 0
			Pokemon.delete(poke_id)
		end
		redirect_to trainer_path(id: trainer_id)
	end

	def new
		@pokemon = Pokemon.new()	
	end

	def create
		poke = Pokemon.create(name: params[:pokemon][:name], health: 100, 
			level: 1, trainer_id: current_trainer.id)
		if poke.id == nil
			flash[:error] = poke.errors.full_messages.to_sentence
			redirect_to pokemons_new_path
		else
			redirect_to trainer_path(id: current_trainer.id)
		end
	end

end
