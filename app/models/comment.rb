class Comment < ApplicationRecord
    belongs_to :map, optional: true
end
