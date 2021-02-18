class MenuItem < ActiveRecord::Base
  belongs_to :menu
  validates :menu_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  has_one_attached :avatar
end