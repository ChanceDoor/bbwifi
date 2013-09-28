class Store < ActiveRecord::Base
  belongs_to :store_manager
  attr_accessible :background, :logo, :mall, :name, :onlines
  mount_uploader :background, AvatarUploader
  mount_uploader :logo, AvatarUploader
end
