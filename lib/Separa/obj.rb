class Separa
    module Obj
        
        def self.call(text, opts)
          divider = opts[:divider] || ':'
          res = wonderflat(text)
          res.map{|k, v| "#{k.to_s}#{divider}#{v.to_s}"}
        end
      
        def self.wonderflat(hash, k = [])
          return {k.join('.') => hash} unless hash.is_a?(Hash)
          hash.inject({}){ |h, v| h.merge! self.wonderflat(v[-1], k + [v[0]]) }
        end        
    end
end
