module Dropkick
  # This class is used when you want to observe object
  class Event

    class << self
      attr_accessor :class_listeners
      def add_listener(klass)
        @class_listeners ||=  []
        @class_listeners << klass
        @class_listeners
      end

      def class_listeners
        defined?(@class_listeners) ? @class_listeners.collect{|x| eval(x).new} : []
      end

    end

    # Create emptry list of listeners and add listener to it
    def add_listener(listener)
      if @listeners.nil?
        @listeners = []    
      end

      @listeners << listener
    end

    # Returning list of listeners
    def listeners
      (@listeners || []) + (self.class.class_listeners || [])
    end

    # Trigger event with "any name u want" and attach sender and sending object
    def trigger(event, object=nil)
      listeners.each do |listener|
        listener.send event, self, object
      end
    end

  end

end