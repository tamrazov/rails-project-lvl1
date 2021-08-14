#frozen_string_literal: true

class Tag
  def self.build(tag, *attrs)
    result = "<#{tag}"
    attrs.each do |items|
      items.each do |key, value|
        if value == nil
          result = "#{result} #{key}"
        else
          result = "#{result} #{key}=\"#{value}\""
        end
      end
    end
    result = block_given? ? "#{result}>#{yield}</#{tag}>" : "#{result}>"
  end
end