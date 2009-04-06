# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class People
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/people.json/
      [200, {"Content-Type" => "text/html"}, ["Hello, World!"]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
