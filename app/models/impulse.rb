class Impulse < ActiveRecord::Base
  belongs_to :user
  belongs_to :impulsetreattype
  has_many :treats
end
