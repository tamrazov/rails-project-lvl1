# frozen_string_literal: true

require_relative 'tag'

class Input
  attr_accessor :user, :name

  def self.build(user, name)
    label = Tag.build('label', for: name) { name.capitalize }
    input = if user[:"#{name}"]
              Tag.build('input', type: 'text', name: name, value: user[:"#{name}"])
            else
              Tag.build('input', type: 'text', name: name)
            end

    "#{label}#{input}"
  end
end
