class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :designs, dependent: :destroy
  has_many :favorites
  has_many :comments
  has_many :reports

  def active_for_authentication?
    super && (is_active == true)
  end
end
