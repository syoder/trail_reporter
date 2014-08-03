class Trail < ActiveRecord::Base
  has_many :reports

  validates :name,
    presence:   true,
    uniqueness: true
end
