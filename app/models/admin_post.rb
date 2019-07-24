class AdminPost < ApplicationRecord
   validates :title, presence: true
   validates :content, presence: true
   # validates :category, presence: true
end
