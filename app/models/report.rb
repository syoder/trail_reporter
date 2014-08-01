class Report < ActiveRecord::Base
  has_many :comments
  belongs_to :trail
  has_many :tags
  belongs_to :user
  belongs_to :category
end
