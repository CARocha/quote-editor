# app/models/quote.rb
class Quote < ApplicationRecord
  validates :name, presence: true
end
