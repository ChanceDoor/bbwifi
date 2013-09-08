class Advertisement < ActiveRecord::Base
  belongs_to :store_manager
  attr_accessible :image_path, :link_path, :name, :position
  mount_uploader :image_path, AvatarUploader
end