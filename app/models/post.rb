class Post < ApplicationRecord
  validates :motherboard, presence: true
  validates :memory, presence: true
  validates :power_supply_unit, presence: true
  validates :computer_case, presence: true
  validates :cpu_cooler, presence: true
  validates :graphics_board, presence: true
  validates :total_price, presence: true
  validates :comment, presence: true
  validates :cpu_model_number, presence: true
  validates :cpu, presence: true

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :greats, dependent: :destroy


  has_one_attached :profile_image #画像用のカラム名

  enum cpu_kind: {intel: 1, ryzen: 2, other: 3}

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(customer)
    greats.exists?(customer_id: customer.id)
  end

end
