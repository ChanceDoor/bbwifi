class HomeController < ApplicationController
  def index
    @advertisements = current_store_manager.advertisements.all
    @active_ads = []
    @active_ads.push(@advertisements.find{|a| a.position == 1})
    @active_ads.push(@advertisements.find{|a| a.position == 2})
    @active_ads.push(@advertisements.find{|a| a.position == 3 })

    @store = Store.find(:all,:conditions => {:store_manager_id => current_store_manager.id})
  end
end
