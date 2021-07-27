class Post < ApplicationRecord
    belongs_to :feed, :optional => true

    
    
end
