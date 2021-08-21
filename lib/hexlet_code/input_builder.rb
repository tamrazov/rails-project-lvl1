# frozen_string_literal: true

require_relative 'tag'
require_relative 'input'
require_relative 'textarea'
require_relative 'select'

class InputBuilder
  attr_accessor :user, :name, :attrs

  def self.build(user, name, attrs)
    input = Input.build(user, name) if attrs.length.zero?

    attrs.each do |attr|
      input = case attr[:as]
              when :text
                Textarea.build(user, name)
              else
                Select.build(user, name, attr)
              end
    end

    input
  end
end
