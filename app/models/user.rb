class User < ApplicationRecord

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

    has_many :calculations
    has_many :purchases
    has_many :packs, through: :purchases
    has_many :quantities, through: :packs
    has_many :constantss, through: :packs
    has_many :units_of_measurement, through: :quantities

end
