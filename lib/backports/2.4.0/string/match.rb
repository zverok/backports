unless String.method_defined? :match?
  class String
    def match?(str, pos = nil)
      # Fiber to avoid setting $~
      f = Fiber.new do
        !match(str, pos).nil?
      end
      f.resume
    end
  end
end
