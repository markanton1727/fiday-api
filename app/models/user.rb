class User < ApplicationRecord
  include Discard::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  default_scope -> { kept }

  class << self
    def authenticate(username, password)
      user = User.find_for_authentication(email: username)
      user.try(:valid_password?, password) ? user : nil
    end
  end
end
