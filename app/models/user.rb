class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :items

  # TODO: Add dependant: :destroy later
# NOTE Make this user profile only visible to owner
  # scope :visible_to, ->  (user){ user ? all : where(public: true) }
  # scope :visible_to, ->  (user){ (user == self || user.admin) ? all : where(public: true) }
  # TODO On user creation, add a checkbox to set user profile to public
  scope :visible_to, ->  (user){ user.admin || user == self ? all : where(public: true) }
  # scope :visible_to, -> { where(public: true) }
end
