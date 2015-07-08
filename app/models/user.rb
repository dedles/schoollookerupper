class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[\w]+\z/i,
		message: "must be in format: example@example.example" }

end
 