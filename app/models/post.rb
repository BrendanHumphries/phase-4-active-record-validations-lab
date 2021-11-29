class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :must_clickbait

    def must_clickbait
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, 'Your title isn\'t clickbait')
        end
    end
end
