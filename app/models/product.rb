# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)      not null
#  description :text(65535)      not null
#  price       :integer          not null
#  unit        :string(255)      default("yen"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :unit, presence: true
  extend Enumerize
  enumerize :unit, in: [:yen, :usd]
  mount_uploader :image, ImageUploader
  include Hashid::Rails
  has_many :basket_products, dependent: :destroy
  has_many :purchase_product_records, dependent: :destroy
end
