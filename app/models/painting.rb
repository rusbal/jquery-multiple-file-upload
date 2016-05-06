class Painting < ActiveRecord::Base
  # before_create :default_name

  # validates :name, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader

  # def default_name
  #   self.name ||= File.basename(image.filename, '.*').titleize if image
  # end
end
