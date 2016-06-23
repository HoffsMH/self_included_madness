require 'pry'

module Storable

 #here is whats actually happening in the gem
 def self.included(base)
   base.extend Foo
 end

  module Foo
    def store
      "Foo"
    end
  end
end

class PhoneCall
  include Storable
end


puts PhoneCall.store # this works but is the old method

# notice that its not possible to override this method by calling define_singleton_method on storable
Storable.define_singleton_method(:store) { "bar" }
puts PhoneCall.store # => "Foo"

# This is because PhoneCall isn't geting its new Class methods from Storable
# its getting them from the Foo module
# defining methods on the Storable class object will not in anyway affect what
# Phonecall inherits unless otherwise specified in self.included

binding.pry

puts "Done"
