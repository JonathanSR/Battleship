require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/message'
require 'pry'

class MessageTest < Minitest::Test

  def test_can_message_be_accessed
    message = "/nWelcome to BATTLESHIP!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit? >"
    assert_equal message, Message.welcome
  end
end
