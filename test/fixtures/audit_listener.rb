class AuditListener < Dropkick::Listener
  attr_reader :history
  def initialize
    @history = []
  end
  def password_reset(sender,user)
    @history << "Audit received for #{user}"
    self
  end  
end

