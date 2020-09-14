class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :articles, dependent: :destroy
         has_many :article_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy
         attachment :self_image

   with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :post_number
    validates :address
    validates :user_name
    validates :email
    validates :introduction
  end
  validates :last_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :post_number, format: /\A[0-9]+\z/

  def full_name
    self.last_name + " " + self.first_name
  end
  
    def after_sign_in_path_for(resource)
         root_path
    end
end
