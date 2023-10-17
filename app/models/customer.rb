class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :greats, dependent: :destroy
  has_many :great_posts, through: :greats, source: :post
  has_many :comments, dependent: :destroy

  def guest?
    email == 'guest@example.com'
  end

end