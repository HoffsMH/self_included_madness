require 'pry'


module Storable
  def store
    "hi"
  end
end

class PhoneCall
  include Storable
end


binding.pry
puts PhoneCall.store # doesnt work

Storable.define_singleton_method(:store) { "bye" } #also doesn't work
puts PhoneCall.store # doesnt work


# there is no method that can be defined on the Storable module in any way
# that will  let us call PhoneCall.<method>
# therefore defining  a singleton method on Storable will never have any effect


# include, by itself, will only grant instances of PhoneCall methods from Storable
# but we are not using include by itself in Eventosaurus
# next example
puts "done"
