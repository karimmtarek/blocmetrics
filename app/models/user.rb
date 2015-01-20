class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user && user.authenticate(password)
  end
end
