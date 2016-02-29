class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :toggle_activity, :destroy]
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
      redirect_to dash_path, notice: "The provider #{@provider.name} was added to the system"
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

  def toggle_activity
    respond_to do |format|

      if @provider.toggle!(:is_active)
        format.html do
          redirect_to dash_path, notice: "The provider #{@provider.name} was #{@provider.is_active? ? 'activated' : 'deactivated'}"
        end

        format.json { head :no_content }
      else
        format.html do
          redirect_to dash_path, notice: "Unable to toggle the activity of #{@provider.name}"
        end

        format.json do
          render json: { msg: "Unable to toggle the activity of #{@provider.name}" }, status: :unprocessable_entity
        end
      end
    end

  end

  def destroy
    @provider.destory
    redirect_to providers_url, notice: "The provider #{@provider.name} has been deleted"
  end

  private

    def set_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:name)
    end
end
