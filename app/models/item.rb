class Item < ActiveRecord::Base
  scope :recent, -> { order(id: :DESC) }

  enum status: { disable: 0, enable: 1 }

  has_many :photos, dependent: :destroy
  has_many :item_categories
  has_many :categories, through: :item_categories

  accepts_nested_attributes_for :photos
end