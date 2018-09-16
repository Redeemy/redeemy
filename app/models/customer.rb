class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :customer_detail, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :redemptions

  def name
    return "Unknown" unless customer_detail
    customer_detail.name
  end

  def nro_of_points
    accounts.map(&:nro_of_points).inject(:+)
  end
end
