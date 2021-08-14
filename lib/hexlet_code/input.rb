# frozen_string_literal: true

require_relative 'tag'

class Input
  attr_accessor :user, :name

  def self.build(user, name)
    label = Tag.build('label', for: name){name.capitalize}
    input = Tag.build('input', type: 'text', value: user[:"#{name}"], name: name)

    return "#{label}#{input}"
  end
end