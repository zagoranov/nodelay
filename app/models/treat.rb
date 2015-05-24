class Treat < ActiveRecord::Base
  belongs_to :impulse
  belongs_to :impulsetreattype
end
