# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'
# require_relative 'hexlet_code/tag'

# HexletCode module
module HexletCode
  class Error < StandardError; end

  def self.form_for(user, url: '#')
    form = Form.new(user, url)
    yield(form)
    form.build
  end
end
