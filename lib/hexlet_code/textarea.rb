# frozen_string_literal: true

require_relative 'tag'

class Textarea
  attr_accessor :user, :name

  def self.build(user, name)
    textarea = Tag.build('textarea', cols: '20', rows: '40', name: name) { user[:"#{name}"] }
  end
end
