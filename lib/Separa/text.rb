class Separa
    module Text
        require 'pry'
        def self.call(text, opts)
            regexp = opts[:regexp] || /\W/
            text.split(regexp)
        end
    end
end