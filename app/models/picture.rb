class Picture < ActiveRecord::Base
  belongs_to :report
 # validates :report, presence: true

  mount_uploader :picture, PictureUploader
end
