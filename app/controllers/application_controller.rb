class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  after_action :record_page_view
  add_flash_types :success, :info, :warning, :error

  def record_page_view
    unless request.is_crawler?
      ActiveAnalytics.record_request(request)
    end
  end
end
