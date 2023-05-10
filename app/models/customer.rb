class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :first_name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :postal_code, presence: true
  validates :last_name_kana, presence: true, length: { minimum: 2, maximum: 20 }
  validates :first_name_kana, presence: true, length: { minimum: 2, maximum: 20 }
  validates :address, presence: true
  validates :telephone_number, presence: true


  def address_display
    '〒' + postal_code + ' ' + address + ' ' + last_name + first_name
  end

end
