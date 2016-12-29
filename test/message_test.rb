require 'minitest/autorun'
require 'minitest/pride'
require './lib/message'
require 'pry'

class MessageTest < Minitest::Test

  def test_does_message_exist
    message = Message.new
    assert_instance_of Message, message
  end

  def test_do_messages_print
    message = Message.new
    assert_equal "Welcome to BATTLESHIP! Would you like to (p)lay, read the (i)nstructions, or (q)uit? >", message.welcome
  end
end
