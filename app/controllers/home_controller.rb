class HomeController < ApplicationController
  def index
    @ads_grid = initialize_grid(Advertisement)
    @advertisements = Advertisement.find(:all,:conditions => {:store_manager_id => current_store_manager.id})
    @active_ads = []
    @active_ads.push(@advertisements.find{|a| a.position == 1})
    @active_ads.push(@advertisements.find{|a| a.position == 2})
    @active_ads.push(@advertisements.find{|a| a.position == 3 })
  end
end
