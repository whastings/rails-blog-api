class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
  validates :permalink, presence: true
  validates :published, inclusion: { in: [true, false] }

  after_initialize :set_permalink
  before_validation :set_permalink

  private

    def set_permalink
      if self.title && self.title.length > 0 && (!self.permalink || title_changed?)
        self.permalink = self.title.downcase.gsub(/\W/, "-")
      end
    end
end
