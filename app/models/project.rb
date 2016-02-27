class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :projecttip
  has_many :tasks, dependent: :destroy
end
