class Separa
  module Obj

    def self.call(obj, opts)
      divider = opts[:divider] || ':'
      res = wonderflat(obj)
      res.map{|pair,_| "#{pair.keys[0].to_s}#{divider}#{pair.values[0].to_s}"}
    end
  
    def self.wonderflat(obj, memo = [])
      return {
        memo.join('.') => obj
      } unless obj.respond_to?(:inject)
      
      obj.inject([]) do |out_array, _val|
        (head, *_tail) = _val
        tail = _tail.pop
        case tail
          when Array
            tail.map do |tail_elem|
              out_array.push self.wonderflat(tail_elem, memo + [ head ])
            end              
          else
            out_array.push self.wonderflat( tail, memo + [ head ])
          end
          out_array.flatten
      end
    end
  end
end
