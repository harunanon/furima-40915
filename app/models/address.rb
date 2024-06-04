class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'must be in the format XXX-XXXX' }
    validates :region_of_origin_id, numericality: { only_integer: true }
    validates :municipality
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
  end
end
