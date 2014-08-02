class Trail < ActiveRecord::Base
  has_many :reports

  validates :name,
    presence: true,
    unique:   true
end
