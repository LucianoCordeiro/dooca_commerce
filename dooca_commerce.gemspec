Gem::Specification.new do |s|
  s.name        = 'dooca_commerce'
  s.version     = '1.0.6'
  s.summary     = "Dooca Commerce!"
  s.description = "A Ruby implementation of Dooca Commerce API"
  s.authors     = ["Luciano Cesar Cordeiro"]
  s.email       = 'lucianocordeiro1991@hotmail.com'
  s.files       = ["lib/dooca_commerce.rb", "lib/response_handler.rb"]
  s.homepage    =
    'https://rubygems.org/gems/doca_commerce'
  s.license       = 'MIT'

  s.add_dependency('faraday')
end
