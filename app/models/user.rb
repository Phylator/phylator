class User < ApplicationRecord

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    has_many :calculations
    has_many :purchases
    has_many :packs, through: :purchases
    has_many :quantities, through: :packs
    has_many :constants, through: :packs
    has_many :equations, through: :quantities, foreign_key: :quantity_id
    has_many :unit_of_measurements, through: :quantities

end
