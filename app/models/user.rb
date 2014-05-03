class User < ActiveRecord::Base
	  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :Address, :mobile, :role
  has_many :customers

 validates :mobile, presence: true

 belongs_to :customer
  #validates :role, presence: true

 # validates_numericality_of :mobile, presence: true, length: { maximum: 10 }

  end