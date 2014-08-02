class Category < ActiveRecord::Base
  has_many :reports

  validates :name,
    presence:   true,
    uniqueness: { case_sensitive: false }

end
