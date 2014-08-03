class Report < ActiveRecord::Base
  has_many :comments
  has_many :pictures, :dependent => :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true
  belongs_to :trail
  has_and_belongs_to_many :tags
  belongs_to :user
  belongs_to :category


  validates :latitude,
    presence:     true,
    numericality: true

  validates :longitude,
    presence:     true,
    numericality: true


  def tags_text
    tags.pluck(:name).join(",")
  end

  def tags_text=(value)
    self.tag_ids = value.split(",").map do |tag_name|
      Tag.where(name: tag_name.strip.downcase).first_or_create.id
    end
  end
end
