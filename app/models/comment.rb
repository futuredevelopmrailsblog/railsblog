class Comment < ApplicationRecord

    belongs_to :pictureshot
    belongs_to :user
end
