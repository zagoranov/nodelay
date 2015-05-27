class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :messages
  has_many :votes
  has_many :goals
  has_many :tasks
  has_many :impulses
  has_many :impulsetreattypes


attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

  validates :email, 
         presence: true,
         uniqueness: true
  
  validates :name, 
         presence: true
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


def self.search(query)
  where("name like ?", "%#{query}%") 
end

 
end
