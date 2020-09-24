class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:twitter]
  has_many :posts
  has_one :aisyo_soldier


  validates :nickname, presence: true, length: { maximum: 12 }

  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)
  
    user ||= User.create!(
      uid: auth.uid,
      provider: auth.provider,
      nickname: auth[:info][:nickname],
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )
  
    user
  end
  
  def self.dummy_email(auth)
    "#{Time.now.strftime('%Y%m%d%H%M%S').to_i}-#{auth.uid}-#{auth.provider}@example.com"
  end
end
