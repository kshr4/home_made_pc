class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  has_many :posts, dependent: :destroy
  has_many :greats, dependent: :destroy
  has_many :great_posts, through: :greats, source: :post
  has_many :comments, dependent: :destroy

  def guest?
    email == 'guest@example.com'
  end

end