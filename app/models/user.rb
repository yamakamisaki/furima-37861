class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password ,format: {with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)}
     # ひらがな、カタカナ、漢字のみ許可する
    validates :first_name , format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :last_name ,  format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    # カタカナのみ許可する
    validates :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/}
    validates :last_name_kana , format: {with: /\A[ァ-ヶー]+\z/}
  end
end
