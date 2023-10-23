class ApplicationController < ActionController::Base
  after_action :record_page_view
  add_flash_types :success, :info, :warning, :error

  def record_page_view
    unless request.is_crawler?
      ActiveAnalytics.record_request(request)
    end
  end
end
