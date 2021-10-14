class User < ApplicationRecord
  enum user_type: {admin: 0, writingbroker: 1, support: 2}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  validates_presence_of :name

  has_many :business_users, :dependent => :destroy
  has_many :businesses, through: :business_users

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
  
end
