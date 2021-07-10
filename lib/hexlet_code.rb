# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  class Tag
    def self.build(tag, *attrs)
      result = "<#{tag}"
      attrs.each do |items|
        items.each do |key, value|
          result = "#{result} #{key}=\"#{value}\""
        end
      end
      if block_given?
        result = "#{result}>#{yield}</#{tag}>"
      else
        result = "#{result}>"
      end
    end
  end
end
