class PasswordResetListener < Dropkick::Listener
  listens_for :user_event
  attr_reader :history
  def initialize
    @history = []
  end
  def password_reset(sender,user)
    @history <<  "Reset received for #{user}"
    self
  end
end
