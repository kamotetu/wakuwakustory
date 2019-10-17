class Story < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :tags, through: :story_tags
  has_many :story_tags, dependent: :destroy

  def save_categories(tags)
    current_tags = self.tags.pluck(:tag) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      article_category = Category.find_or_create_by(name:new_name)
      self.categories << article_category
    end
  end
end
