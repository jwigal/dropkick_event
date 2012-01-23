module Dropkick
  # This class represents Listener
  class Listener

    class << self
      def listens_for(*klasses)
        klasses.each{|klass| klass.send :add_listener, self.new }
      end
    end

    # Call method/event if exists
    def method_missing(method, *args, &block)
      if self.respond_to? method
        self.send(method, *args, &block)
      end
    end

  end

end