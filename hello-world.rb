require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

client = Couchbase.new "http://109.169.74.98:8091/pools/default"
begin 
  spoon = client.get "spoon"
  puts spoon
rescue Memcached::NotFound => e
  puts "There is no spoon."
  client.set "spoon", "Hello World!", 10
end

