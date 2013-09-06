class AdvertisementsController < ApplicationController
  def show 
    @advertisement = Advertisement.find(params[:id])
  end

  def edit 
    @advertisement = Advertisement.find(params[:id])
  end

  def new 
    @advertisement = Advertisement.new
  end

  def create 
    @manager = current_store_manager
    @advertisement= @manager.advertisements.new(params[:advertisement])
    if @advertisement.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @advertisement = Advertisement.find(params[:id])
    if @advertisement.update_attributes(params[:advertisement])
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy
    redirect_to root_path
  end

end
