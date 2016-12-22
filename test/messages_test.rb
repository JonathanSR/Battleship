require 'minitest/autorun'
require 'minitest/pride'
require './lib/messages'
require 'pry'

class MessagesTest < Minitest::Test

  def test_does_messages_exist
  messages = Messages.new
  assert_instance_of Messages, messages
  end

  def test_do_messages_print
  messages = Messages.new
  welcome = "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  assert_equal "Welcome to BATTLESHIP, Would you like to (p)lay, read the (i)nstructions, or (q)uit?", messages.welcome
  end
end
