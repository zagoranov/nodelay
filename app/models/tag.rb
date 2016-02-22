class Tag < ActiveRecord::Base
  has_and_belongs_to_many :tasks


def self.search(query)
  where("name like ?", "%#{query}%") 
end


end
