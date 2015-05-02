class Separa

    Dir[File.dirname(__FILE__) + '/Separa/*.rb'].each {|file| require file }

    attr_reader :separador

    def initialize(separador = Separa::Text, opts = {})
        if separador.respond_to?(:call)
            @separador = separador
        else
            @separador = Separa::Text
        end
        @opts = opts
    end

    def call(words)
        @separador.call(words, @opts)
    end


end