class Post < ApplicationRecord

  belongs_to :customer
  has_many :comments, dependent: :destroy
  has_many :greats, dependent: :destroy


  has_one_attached :profile_image #画像用のカラム名

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(customer)
    greats.exists?(id: id)
  end

end
