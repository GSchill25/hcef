module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  #this function was taken off from website http://railscasts.com/episodes/211-validations-in-rails-3
  #slight changes were made due to Rails 3 -> Rails 4
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveRecord::Validations::PresenceValidator
  end

  # Renders an AJAX friendly toggle_activity button for a given resource
  # Expects is_active? method on resource to determine activity
  # Assumes path helper name of toggle_activity_resource-class-name-here_url
  def toggle_activity_button(resource,url=nil)
    path ||= Rails.application.routes.url_helpers.send("toggle_activity_#{resource.class.name.downcase}_path", id: resource.id)

    toggle_text = ["Make Active", "Make Inactive"]
    current_text = (resource.is_active? ? toggle_text.last : toggle_text.first)
    other_text = (resource.is_active? ? toggle_text.first : toggle_text.last)

    classes = ["btn btn-toggle btn-warning", "btn btn-toggle btn-info"]
    current_class = (resource.is_active? ? classes.first : classes.last)
    other_class = (resource.is_active? ? classes.last : classes.first)

    html = link_to current_text, path, :method => :put, :remote => true, "data-type" => "json", :class => current_class,
      :data => { 'other-text' => other_text, 'other-class' => other_class }

    html.html_safe
  end
end
