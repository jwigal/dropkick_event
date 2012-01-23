module Dropkick
  # This class represents Listener
  class Listener

    class << self
      def listens_for(*klasses)
        klasses.each{|klass| eval(klass.to_s.classify).send :add_listener, self.to_s }
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