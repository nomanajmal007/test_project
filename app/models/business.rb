class Business < ApplicationRecord
    validates_presence_of:name , :description
    has_many :business_users, :dependent => :destroy
    has_many :users, through: :business_users
    has_many :tasks
    belongs_to :owner , class_name: 'User'
    # , :dependent => :destroy

end