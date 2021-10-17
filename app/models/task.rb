class Task < ApplicationRecord
    
    belongs_to :business
    validates :title, uniqueness: true
    mount_uploader :image, ImageUploader
end
