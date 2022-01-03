class Student < ApplicationRecord
  has_and_belongs_to_many :sections, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def first_and_last_name
    "#{first_name} #{last_name}"
  end

  def name
    "#{first_name} #{last_name}"
  end
end
