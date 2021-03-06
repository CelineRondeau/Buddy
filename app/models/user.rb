class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :languages, through: :spoken_languages
  has_many :requests, dependent: :destroy
  has_many :events, dependent: :destroy
  has_one_attached :photo

  validates :first_name, :last_name, :age, :living_in, :photo, presence: true

end
