class Advertisement < ActiveRecord::Base
  default_scope order: 'id desc'
  belongs_to :store_manager
  attr_accessible :image_path, :link_path, :name, :position
  mount_uploader :image_path, AvatarUploader
end
