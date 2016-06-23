require 'pry'


module Storable

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

puts PhoneCall.store # => Foo
# ... ok
Storable::Foo.define_singleton_method(:store) { "stub1" }
# This is like appending the following text to our definition of the Foo Module
# def self.store
#   "stub1"
# end
# which means we can call
puts Storable::Foo.store # => stub1
# and it will work beatifully
# but self methods on modules are not considered when calling extend
# only the "def store" method gets added as a class method to PhoneCall when we call extend
# so the class methods of PhoneCall
puts PhoneCall.store # => Foo
#  do not include the "def self.store" defined on line 23

# here is one way to do what we wanted
Storable::Foo.send(:define_method, :store) { "stub2" }
# This is like appending following text to our definition of the Foo module
# def store
#   "stub1"
# end
# so when we call
puts PhoneCall.store # => stub2
# we get our stub
# but this involves calling a private method through send
# we can use active support to do it without send though
require 'active_support'
require 'active_support/core_ext'
Storable::Foo.redefine_method(:store) { "stub3" }
puts PhoneCall.store # => stub3

puts "Done."
