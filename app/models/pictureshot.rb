class Pictureshot < ApplicationRecord
    belongs_to :user
    
    has_many :comments, dependent: :destroy

    
    mount_uploader :user_pictureshot, UserPictureshotUploader
end
