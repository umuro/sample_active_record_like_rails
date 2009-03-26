Factory.sequence :parent_name do |n| "parent_#{n}" end
Factory.sequence :offspring_name do |n| "offspring_#{n}" end

Factory.define :parent do |f|
  f.name  {|n| Factory.next(:parent_name)}
#  f.properties {|properties|
#    children = Array.new( rand(6) ) { properties.association(:property) }
#    }
end

Factory.define :property do |f|
  f.sequence(:name) {|n| "property_#{n}" }
  f.sequence(:value) {|n| n }
  f.parent {|a| @the_parent ||= a.association(:parent)}
end