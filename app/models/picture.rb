class Picture < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :image

  mount_uploader :image, ImageUploader
end
