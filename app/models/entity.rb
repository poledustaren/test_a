class Entity < ActiveRecord::Base
  belongs_to :entity
  has_many :entity

  validates :name, presence: true
  validates :text, presence: true
  validates :title, presence: true
end



