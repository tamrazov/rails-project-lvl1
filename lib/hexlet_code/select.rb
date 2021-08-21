# frozen_string_literal: true

require_relative 'tag'

class Select
  attr_accessor :user, :name

  def self.build(user, name, attr)
    input = Tag.build('select', name: name) {
      attr[:collection].each do |el|
        option = Tag.build('option', value: el){el}
        input = "#{input}#{option}"
      end

      input
    }
  end
end