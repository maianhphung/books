class User < ApplicationRecord
 has_many :books
 has_many :reviews
 has_many :posts
 has_one :profile, :dependent => :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
