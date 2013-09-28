class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
    @manager = current_store_manager
    @store = @manager.stores.new(params[:store])
    if @store.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @store = Store.find(params[:id])
  end
  def index
  end
  def delete
  end
  def edit
    @store = Store.find(params[:id])
  end
  def update
  end
  def login
    @client = Client.new
    @store = Store.find(params[:store_id])
    render :layout => false
  end

end
