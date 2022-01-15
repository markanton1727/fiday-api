class User < ApplicationRecord
  include Discard::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  default_scope -> { kept }
  validate :validate_mobile_phone

  class << self
    def authenticate(username, password)
      user = User.find_for_authentication(email: username)
      user.try(:valid_password?, password) ? user : nil
    end
  end

  def validate_mobile_phone
    errors.add(
      :mobile_phone,
      I18n.t('activerecord.errors.models.users.attributes.mobile_phone_invalid')
    ) unless Phonelib.valid?(self.mobile_phone)
  end
end
