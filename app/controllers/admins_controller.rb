class AdminsController < ApplicationController
  def index
    @store_managers = StoreManager.all
  end

  def destroy_store_manager
    @store_manager = StoreManager.find(params[:id])
    @store_manager.destroy
    redirect_to admin_root_path
  end
end
