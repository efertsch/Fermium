class User < ActiveRecord::Base
  # Add associations here 

  has_many :answers
  has_many :votes
  has_many :questions
  has_many :comments


  validates :email, uniqueness: true 

  def password 
  	@password ||= BCrypt::Password.new(password_hash)
  end 

  def password=(plain_text_password)
  	@password = BCrypt::Password.create(plain_text_password)
  	self.password_hash = @password 
  end 

  def self.authenticate(email, password)
  	valid_user = User.find_by(email: email)
  	valid_user.password == password ? valid_user : nil 
  end 

end
