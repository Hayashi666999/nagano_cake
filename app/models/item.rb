class Item < ApplicationRecord
has_many :order_details

has_one_attached :image

def get_image(x,y)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  image.variant(resize_to_limit: [x, y]).processed
end
end
