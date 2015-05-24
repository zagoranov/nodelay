class Impulsetreattype < ActiveRecord::Base
  has_many :impulses
  has_many :treats
  belongs_to :user
end
