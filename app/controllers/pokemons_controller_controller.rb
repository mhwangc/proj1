class PokemonsControllerController < ApplicationController

	def capture(params)
		poke_id = params[:id]
		poke = Pokemon.find(poke_id)
		poke.update(trainer_id: current_trainer.id)
		redirect_to root
	end
end
