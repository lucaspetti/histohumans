class Country < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :people
  has_many :maps
  belongs_to :continent

  validates :name, presence: true

  def people?
    true unless people.empty?
  end

  def self.empty_count
    s = 0
    Country.all.each { |c| s += 1 if c.people? }
    "#{s} countries have characters. #{Country.count - s} are empty"
  end

  def self.print_empty
    empty = []
    Country.all.each { |c| empty << c.name unless c.people? }
    puts empty
  end
end
