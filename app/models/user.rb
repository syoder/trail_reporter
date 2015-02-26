require 'securerandom'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reports
  belongs_to :role

  def admin?
    role && role.admin?
  end

  def generate_api_token!
    self.update!(api_token: SecureRandom.hex(24))
    return self.api_token
  end
end
