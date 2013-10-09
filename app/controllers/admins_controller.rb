class AdminsController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @store_managers = StoreManager.all
  end

  def new_store_manager
    @store_manager = StoreManager.new
    render 'new_store_manager'
  end

  def create_store_manager
    @store_manager = StoreManager.new(params[:store_manager])
    if @store_manager.save
      redirect_to admin_root_path
    else
      render 'new_store_manager'
    end

  end

  def edit_store_manager
    @store_manager = StoreManager.find(params[:id])
    render 'edit_store_manager'
  end

  def update_store_manager
    @store_manager = StoreManager.find(params[:id])
    if @store_manager.update_attributes(params[:store_manager])
      redirect_to admin_root_path
    else
      render 'edit_store_manager'
    end
  end

  def destroy_store_manager
    @store_manager = StoreManager.find(params[:id])
    @store_manager.destroy
    redirect_to admin_root_path
  end
end
