class Business < ApplicationRecord

    validates_presence_of:name
    has_many :business_users
    has_many :users, through: :business_users

end
