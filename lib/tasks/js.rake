namespace :js do
  task :minify do
    require 'net/http'
    
    file_name = "application.js"
    input_path = 'public/javascripts'
    output_path = input_path
    
    params = {
      "js_code" => File.new("#{input_path}/#{file_name}").read,
      "output_format" => "text",
      "output_info" => "compiled_code"
    }
    
    res = Net::HTTP.post_form(URI.parse('http://closure-compiler.appspot.com/compile'), params)
    
    raise "Error: #{res.body}" unless res.is_a? Net::HTTPOK
    
    File.new("#{input_path}/#{file_name}".gsub(".js", ".min.js"), "w+").write(res.body)
    
    puts "Done."
  end
end
