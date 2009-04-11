# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

# The find ppl by name metal!
class People
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/people.json/
      request = Rack::Request.new(env)
      ppl = Person.all(:select => "people.name, people.id", :order => "people.name",
                       :conditions => ["name LIKE ?","%#{request[:name]}%"])

      [200, {"Content-Type" => "text/html"}, ppl.to_json]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"].to_json]
    end
  end
end
