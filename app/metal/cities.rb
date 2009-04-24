# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

# The find ppl by name metal!
class Cities
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/cities.json/
      request = Rack::Request.new(env)
      cities = City.all(:select => "cities.name, cities.id", :order => "cities.name",
                       :conditions => ["cities.name LIKE ?", "%#{request[:q]}%"])
      [200, {"Content-Type" => "text/html"}, cities.map { |p| "#{p.name}|#{p.id}\n" }]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"].to_json]
    end
  end
end
