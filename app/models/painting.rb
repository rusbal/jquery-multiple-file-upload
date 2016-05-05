class Painting < ActiveRecord::Base

  validates :name, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
