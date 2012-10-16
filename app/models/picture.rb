class Picture < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :image, :tag_list
  mount_uploader :image, ImageUploader
  acts_as_taggable
  belongs_to :user
end
