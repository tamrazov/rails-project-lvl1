# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User1 = Struct.new(:name, :job, keyword_init: true)

  def test_form_for
    user = User1.new name: 'rob'
    test_form = HexletCode.form_for user do |f| end
    test_form_url = HexletCode.form_for user, url: '/users' do |f| end

    assert_equal '<form action="#" method="post"></form>', test_form
    assert_equal '<form action="/users" method="post"></form>', test_form_url
  end

  User2 = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_form_for_with_inputs
    user = User2.new name: 'rob', job: 'hexlet', gender: 'm'
    test_form_with_inputs = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
      f.input :gender, as: :select, collection: %w[m f]
    end

    assert_equal '<form action="#" method="post"><label for="name">Name</label><input type="text" name="name" value="rob"><textarea cols="20" rows="40" name="job">hexlet</textarea><select name="gender"><option value="m">m</option><option value="f">f</option></select></form>',
                 test_form_with_inputs
  end

  User3 = Struct.new(:name, :job, keyword_init: true)

  def test_submit
    user = User3.new job: 'hexlet'

    test_submit = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal '<form action="#" method="post"><label for="name">Name</label><input type="text" name="name"><label for="job">Job</label><input type="text" name="job" value="hexlet"><input type="submit" value="Save" name="commit"></form>',
                 test_submit
  end
end
