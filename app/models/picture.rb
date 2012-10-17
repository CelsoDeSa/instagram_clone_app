class Picture < ActiveRecord::Base
  attr_accessible :description, :title, :user_id, :image, :tag_list
  mount_uploader :image, ImageUploader
  acts_as_taggable
  belongs_to :user

  before_save :get_user_id

  def get_user_id
    user_id: User.find(session[:user_id])
  end
end
