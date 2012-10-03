class Picture < ActiveRecord::Base
  attr_accessible :comment, :name, :user_id, :image

  mount_uploader :image, ImageUploader
end
