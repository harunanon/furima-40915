class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :quality
  belongs_to :payment
  belongs_to :region_of_origin
  belongs_to :delivery_day

  validates :name, :image, :price, :text, :genre_id, :quality_id, :payment_id, :region_of_origin_id, :delivery_day_id, presence: true
  validates :price, numericality: { less_than: 9_999_999, greater_than: 300 }
  validates :price, presence: true, numericality: { only_integer: true }

  with_options numericality: { other_than: 0 } do
    validates :genre_id
    validates :quality_id
    validates :payment_id
    validates :region_of_origin_id
    validates :delivery_day_id
  end
end