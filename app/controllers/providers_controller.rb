class ProvidersController < ApplicationController
	before_action :set_provider, only: [:show, :edit, :update, :destroy]
	authorize_resource

	def index
	end

	def show
	end

	def new
		@provider = Provider.new
	end

	def edit
	end

	def create
		@provider = Provider.new(provider_params)
		if @provider.save
			redirect_to new_provider_path, notice: "The provider #{@provider.name} was added to the system"
		else
			render action: 'new'
		end
	end

	def update
		if @provider.update(provider_params)
			redirect_to @provider, notice: "The provider #{@provider.name} has been updated"
		else
			render action: 'edit'
		end
	end

	def destroy
		@provider.destory
		redirect_to providers_url, notice: "The provider #{@provider.name} has been deleted"
	end

	private

		def set_provider
			@provider = provider.find(params[:id])
		end

		def provider_params
			params.require(:provider).permit(:name)
		end
end
