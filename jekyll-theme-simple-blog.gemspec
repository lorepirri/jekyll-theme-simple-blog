# encoding: utf-8

Gem::Specification.new do |s|
  s.name          = "jekyll-theme-simple-blog"
  s.version       = "0.0.1"
  s.license       = "CC0-1.0"
  s.authors       = ["Lorenzo Pirritano"]
  s.email         = ["lorepirri@gmail.com"]
  s.homepage      = "https://github.com/lorepirri/jekyll-theme-simple-blog"
  s.summary       = "Simple Blog Theme is a clean, responsive blogging theme for Jekyll and GitHub Pages, with social/SEO features. Based on Simple Blog Theme."

  s.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^((_includes|_layouts|_sass|assets)/|(LICENSE|README|index|about|contact|404)((\.(txt|md|markdown)|$)))}i)
  end

  s.platform      = Gem::Platform::RUBY
  s.add_runtime_dependency "jekyll", "~> 3.3"
end
