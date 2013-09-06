class HomeController < ApplicationController
  def index
    @advertisements = Advertisement.find(:all,:conditions => {:store_manager_id => current_store_manager.id})
  end
end
