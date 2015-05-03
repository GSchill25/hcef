module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  #this function was taken off from website http://railscasts.com/episodes/211-validations-in-rails-3
  #slight changes were made due to Rails 3 -> Rails 4
  def mark_required(object, attribute)  
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveRecord::Validations::PresenceValidator  
  end
end
