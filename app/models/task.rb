class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :tasktip
  has_and_belongs_to_many :tags
end
