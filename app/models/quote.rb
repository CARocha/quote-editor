# app/models/quote.rb
class Quote < ApplicationRecord

  # Validations
  validates :name, presence: true

  # Scopes
  scope :ordered, -> { order(id: :desc) }

  # Callback, realtime broadcast
  after_create_commit -> { broadcast_prepend_to 'quotes', partial: 'quotes/quote', locals: { quote: self }, target: 'quotes' }
end
