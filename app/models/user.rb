class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :email, presence: true   
         validates :password, presence: true,format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は半角英数字混合で入力してください" }
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角文字を使用してください' }
         validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/, message: '全角文字を使用してください' }
         validates :first_name_kana,presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' }
         validates :birth_date, presence: true

        end
