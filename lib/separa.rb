class Separa

    Dir[File.dirname(__FILE__) + '/Separa/*.rb'].each {|file| require file }

    attr_reader :separador

    def initialize(separador = Separa::Text, opts = {})
        

        if separador.respond_to?(:call)
            @separador = separador
            @opts = opts
        else
            @separador = Separa::Text
            @opts = separador
        end
    end

    def call(words)
        @separador.call(words, @opts)
    end


end