module ApplicationHelper
  def active_menu(menu)
    "active" if controller_name == menu
  end
end
