module EventsHelper
  def get_user(event)
    user = User.find(event.user_id)
    content_tag(:strong, user.email)
  end
end
