class Report < ActiveRecord::Base
  has_many :comments
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

  after_initialize :set_default_reported_at

  def set_default_reported_at
    self.reported_at ||= DateTime.now
  end

  def tags_text
    tags.pluck(:name).join(",")
  end

  def tags_text=(value)
    self.tag_ids = value.split(",").map do |tag_name|
      Tag.where(name: tag_name.strip.downcase).first_or_create.id
    end
  end


  def category_name
    (category) ? category.name : nil
  end
end
