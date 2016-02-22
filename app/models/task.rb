class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  has_and_belongs_to_many :tags
end
