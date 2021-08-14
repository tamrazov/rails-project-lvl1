# frozen_string_literal: true

require_relative 'tag'
require_relative 'input'


class InputBuilder
  attr_accessor :user, :name, :attrs

  def self.build(user, name, attrs)
    input = Input.build(user, name) if attrs.length == 0

    # attrs.each do |attr|
    #   case attr[:as]
    #   when :text
    #     input = Tag.build('textarea', cols: "20", rows: "40",  name: name){@user[:"#{name}"]}
    #   else
    #     input = Tag.build('select', name: name) {
    #       attr[:collection].each do |el|
    #         option = Tag.build('option', value: el){el}
    #         input = "#{input}#{option}"
    #       end

    #       input
    #     }
    #   end
    # end

    input
  end
end