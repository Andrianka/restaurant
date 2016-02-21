class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order_items

  validates :name, presence: true
  validates :category, presence: true

  has_attached_file :image, styles: { medium: "200x200!", thumb: "100x100!" }, default_url: "missing.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  default_scope { where(is_active: true) }

  UnitType = [Grams = 'g', ML = 'ml', Piece = 'piece']
  
end
