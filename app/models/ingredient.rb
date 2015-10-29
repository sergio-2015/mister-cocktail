class Ingredient < ActiveRecord::Base
  has_many :doses
  has_many :cocktails

  validates :name, presence: true, uniqueness: true
end
