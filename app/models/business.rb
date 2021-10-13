class Business < ApplicationRecord
    validates_presence_of:name , :description
    has_many :business_users
    has_many :users, through: :business_users
    has_many :tasks

end
