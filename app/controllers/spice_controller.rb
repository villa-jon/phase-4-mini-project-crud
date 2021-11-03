class SpiceController < ApplicationController

	def index
		spices = Spice.all
		render json: spices 
	end 

	def create 
		spice = Spice.create(spice_params)
		render json: spice, status: :created
	end 

	def show
		spice = find_spice
		render json: spice
	end
	
	def destroy 
		spice = find_spice
		spice.destroy
		head :no_content 
	end 

	def update 
		spice = find_spice
		spice.update(spice_params)
		render json: spice
	end 

	private 

	def spice_params
		params.permit(:title, :image, :description, :notes)
	end 

	def find_spice
		Spice.find_by(id: params[:id])
	end 

end
