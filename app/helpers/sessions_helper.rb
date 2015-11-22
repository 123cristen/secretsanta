module SessionsHelper

	# Logs in the given group.
  def log_in(group)
    session[:group_id] = group.id
  end

    # Returns the current logged-in group (if any).
  def current_group
    @current_group ||= Group.find_by(id: session[:group_id])
  end

    # Returns true if the group is logged in, false otherwise.
  def logged_in?
    !current_group.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:group_id)
    @current_group = nil
  end
end
