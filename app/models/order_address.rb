class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :region_of_origin_id, :municipality, :street_address, :building_name,
                :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_of_origin_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include 10-11 digits' }
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, region_of_origin_id:, municipality:,
                   street_address:, building_name:, phone_number:)
  end
end
