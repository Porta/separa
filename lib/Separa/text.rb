class Separa
    module Text
        def self.call(text, opts)
            regexp = opts[:regexp] || /\W/
            text.split(regexp)
        end
    end
end