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

  def sign_in
    #@client = Client.find(params[:client])
    @store = Store.find(params[:store_id])
    @storemanager = StoreManager.find(@store.store_manager_id)
    @advertisements = @storemanager.advertisements.all
    @active_ads = []
    @active_ads.push(@advertisements.find{|a| a.position == 1})
    @active_ads.push(@advertisements.find{|a| a.position == 2})
    @active_ads.push(@advertisements.find{|a| a.position == 3 })
    render "ad",:layout => false
  end

end
