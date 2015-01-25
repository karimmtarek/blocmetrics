module UsersHelper
  def disable_email?
    if current_user
      true
    else
      false
    end
  end

  def submit_text(user)
    if user.new_record?
      "Sign up"
    else
      "Change password"
    end
  end
end
