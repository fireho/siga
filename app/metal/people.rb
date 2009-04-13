# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

# The find ppl by name metal!
class People
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/people.json/
      request = Rack::Request.new(env)
      ppl = Person.all(:select => "people.name, people.id", :order => "people.name",
                       :conditions => ["name LIKE ?", "%#{request[:q]}%"])
      autocomplete(ppl)
    elsif env["PATH_INFO"] =~ /^\/females.json|^\/males.json/
      request = Rack::Request.new(env)
      ppl = Person.all(:select => "people.name, people.id", :order => "people.name",
                       :conditions => ["name LIKE ? and sex = ?", "%#{request[:q]}%", request[:sex]])
      autocomplete(ppl)
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"].to_json]
    end
  end

  def self.autocomplete(ppl)
    [200, {"Content-Type" => "text/html"}, ppl.map { |p| "#{p.name}|#{p.id}\n" }]
  end
end
