class Problem < ApplicationRecord
  has_many :posts, dependent: :destroy
end
