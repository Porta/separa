# encoding: utf-8

Gem::Specification.new do |s|
  s.name              = "separa"
  s.version           = "0.0.2"
  s.summary           = "Separa splits chunks of text into tokens to be indexed"
  s.description       = "Separa splits chunks of text into tokens to be indexed by Busca, the simple redis search"
  s.authors           = ["Julián Porta"]
  s.email             = ["julian@porta.sh"]
  s.homepage          = "https://github.com/Porta/separa"
  s.files             = `git ls-files`.split("\n")
  s.license           = "MIT"
  s.add_development_dependency "cutest", '~>1.2'
end
