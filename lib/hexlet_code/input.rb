# frozen_string_literal: true

require_relative 'tag'

class Input
  attr_accessor :user, :name

  def self.build(user, name)
    label = Tag.build('label', for: name){name.capitalize}
    if user[:"#{name}"]
      input = Tag.build('input', type: 'text', name: name, value: user[:"#{name}"])
    else
      input = Tag.build('input', type: 'text', name: name)
    end

    return "#{label}#{input}"
  end
end