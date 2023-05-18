class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 
  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: ' Input full-width katakana characters' }
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: ' Input full-width katakana characters' }
  
end
