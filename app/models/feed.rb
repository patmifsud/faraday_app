class Feed < ApplicationRecord
    validates :slug, uniqueness: true
    belongs_to :user, :optional => true
    has_many :posts
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes

    after_create :update_slug
    before_update :assign_slug

    def create_slug
        head = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
        tail = self.id.to_s
        return head + "_" + tail
    end

    def update_slug
        update_attributes slug: assign_slug
    end

    private
        def assign_slug
            self.slug = create_slug
        end
end
