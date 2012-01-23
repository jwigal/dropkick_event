require 'helper'

class TestDropkickEvent < Test::Unit::TestCase
    
  
  context "an event" do
    setup do
      @ue = UserEvent.new
    end

    should "ensure that any class-defined listeners are included in the instance method .listeners" do
      assert @ue.listeners.any?{|x| x.class == PasswordResetListener }
    end
    
    should "ensure that class defined listeners are instances of actual events" do
      assert UserEvent.class_listeners.all?{|l| l.class != Class }
    end

    should "ensure that any instance-defined listeners are included in the instance method .listeners" do   
      @ue.add_listener AuditListener.new
      assert @ue.listeners.any?{|x| x.class == AuditListener }
    end

    should "pass an event through to a listener added via add_listener" do
      AuditListener.any_instance.expects(:password_reset).once
      @ue.add_listener AuditListener.new
      @ue.reset(User.new("Joe", "Schmoe"))      
    end

    should "pass an event through to a listener added via listens_for" do
      PasswordResetListener.any_instance.expects(:password_reset).once
      u=User.new("Joe", "Smith")
      UserEvent.new.reset(u)
    end

  end
  
  

end
