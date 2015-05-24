class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :commvotes

  validates :text, 
         presence: true
  
end
