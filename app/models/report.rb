class Report < ActiveRecord::Base
  has_many :comments
  belongs_to :trail
  has_and_belongs_to_many :tags
  belongs_to :user
  belongs_to :category
end
