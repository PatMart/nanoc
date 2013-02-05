# encoding: utf-8

class Nanoc::CLI::ErrorHandlerTest < MiniTest::Unit::TestCase

  include Nanoc::TestHelpers

  def test_resolution_for_with_unknown_gem
    error = LoadError.new('no such file to load -- afjlrestjlsgrshter')
    assert_nil handler.send(:resolution_for, error)
  end

  def test_resolution_for_with_known_gem
    error = LoadError.new('no such file to load -- kramdown')
    assert_match(/^Make sure the gem is added to Gemfile/, handler.send(:resolution_for, error))
  end

  def test_resolution_for_with_not_load_error
    error = RuntimeError.new('nuclear meltdown detected')
    assert_nil handler.send(:resolution_for, error)
  end

  def handler
    Nanoc::CLI::ErrorHandler.new
  end

end
