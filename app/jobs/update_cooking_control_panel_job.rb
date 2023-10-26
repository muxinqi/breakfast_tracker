class UpdateCookingControlPanelJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "UpdateCookingControlPanelJob.perform"
    CookingRecord.update_control_panel
  end
end
