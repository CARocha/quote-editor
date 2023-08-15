# app/models/quote.rb
class Quote < ApplicationRecord
  belongs_to :company
  # Validations
  validates :name, presence: true

  # Scopes
  scope :ordered, -> { order(id: :desc) }

  # Callback, realtime broadcast
  # after_create_commit -> { broadcast_prepend_to 'quotes', partial: 'quotes/quote', locals: { quote: self }, target: 'quotes' }
  # after_create_commit -> { broadcast_prepend_later_to "quotes" } #el later es para active job
  # after_update_commit -> { broadcast_prepend_later_to "quotes" }
  # after_destroy_commit -> { broadcast_remove_to "quotes" }
  # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { 'quotes' }, inserts_by: :prepend
end
