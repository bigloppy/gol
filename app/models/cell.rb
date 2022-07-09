class Cell < ApplicationRecord
  belongs_to :grid
  default_scope { where(alive: true) }
end
