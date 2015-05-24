class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes


  validates :title, 
         presence: true
  
  validates :text, 
         presence: true

end

