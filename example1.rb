require 'pry'


module Storable
  def store
    "hi"
  end
end

class PhoneCall
  include Storable
end



puts PhoneCall.store # doesnt work

Storable.define_singleton_method(:store) { "bye" } #also doesn't work
puts PhoneCall.store # doesnt work


# there is no method that can be defined on the Storable module in any way
# that will  let us call PhoneCall.<method> after `include`ing Storable
# therefore defining  a singleton method on Storable will never have any effect
# on PhoneCall's class methods


# include, by itself, will only grant instances of PhoneCall the methods from Storable
# but we are not using include by itself in the gem
# next example

puts "done"
