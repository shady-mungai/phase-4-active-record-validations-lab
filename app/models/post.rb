class Post < ApplicationRecord
    
    validate :sufficiently_clickbaity_title

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    def sufficiently_clickbaity_title
        if title.present? && !title.match(/Won't Believe|Secret|Top \d+|Guess/)
          errors.add(:title, 'must be sufficiently clickbait-y')
        end
      end
end
