# frozen_string_literal: true

# Monkey patches to_hash
module Savon
  class QualifiedMessage
    def to_hash(hash, path)
      return hash unless hash
      return hash.map { |value| to_hash(value, path) } if hash.is_a?(Array)
      return hash.to_s unless hash.is_a?(Hash)

      hash.each_with_object({}) do |(key, value), newhash|
        case key
        when :order!
          newhash[key] = add_namespaces_to_values(value, path)
        when :attributes!, :content!
          newhash[key] = to_hash(value, path)
        else
          if key.to_s =~ /!$/
            newhash[key] = value
          else
            translated_key  = translate_tag(key)
            newkey          = add_namespaces_to_values(key, path).first
            newpath         = path + [translated_key]
            newhash[newkey] = to_hash(value, @types[newpath] ? [@types[newpath]] : newpath)
          end
        end
        newhash
      end
    end
  end
end