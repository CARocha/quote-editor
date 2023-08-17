# frozen_string_literal: true

# helper for flash messages
module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend 'flash', partial: 'layouts/flash'
  end
end
