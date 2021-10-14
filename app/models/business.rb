class Business < ApplicationRecord
    validates_presence_of:name , :description
    has_many :business_users, :dependent => :destroy
    has_many :users, through: :business_users
    has_many :tasks
    # , :dependent => :destroy

end
