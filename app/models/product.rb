class Product < ActiveRecord::Base
  belongs_to :company

  #has_attached_file :photo, styles: {medium: "200x200>", thumb: "50x50>"}, url: "/:class/:attachment/:id/:style_:filename", default_url: "default/default_:style_photo.jpg"
  #validates_attachment :photo, content_type: { content_type: %w(image/jpeg image/jpg image/png image/gif) }

  mount_uploader :picture, PictureUploader

end