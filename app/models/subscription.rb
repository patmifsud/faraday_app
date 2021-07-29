class Subscription < ApplicationRecord
    belongs_to :feed, :optional => true

end
