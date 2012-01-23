class UserEvent < Dropkick::Event
  def reset(user)
    trigger :password_reset
  end
end
