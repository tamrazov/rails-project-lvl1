# frozen_string_literal: true

require_relative 'tag'
require_relative 'input_builder'

class Form
  attr_reader :user, :url

  def initialize(user, url)
    @user = user
    @url = url
    @tags = []
  end

  def input(name, *attrs)
    tag = InputBuilder.build(@user, name, attrs)
    @tags.push(tag)
  end

  def submit
    submit = Tag.build('input', type: 'submit', value: 'Save', name: 'commit')
    @tags.push(submit)
  end

  def build
    Tag.build('form', action: @url, method: 'post') { @tags.join }
  end

end