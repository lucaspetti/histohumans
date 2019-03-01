class Person < ApplicationRecord
  belongs_to :country
  has_one :continent, through: :country

  has_many :maps, through: :countries
  has_many :quizzes
  has_one :page

  validates :first_name, presence: true
  validates :birthdate, presence: true
  validates :bio, presence: true

  def self.sample
    Person.all.sample
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def compatriots
    compatriots = Person.where(country: country).to_ary
    compatriots.delete(self)
    compatriots
  end
end
