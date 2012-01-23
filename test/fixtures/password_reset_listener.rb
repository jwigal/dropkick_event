class PasswordResetListener < Dropkick::Listener
  attr_reader :history
  def initialize
    @history = []
  end
  listens_for UserEvent
  def password_reset(sender,user)
    @history <<  "Reset received for #{user}"
    self
  end
end
