require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type brt ..close it and save the output
      pipe.puts("brt") #this is what you want it to print
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a.. B
Give me a.. R
Give me a.. T
EOS
    assert_equal shell_output, expected_output
  end

  def test_a_name_with_no_vowels_a_different_way
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "Give me a.. B", "Give me a.. R", "Give me a.. T"
  end

  # But what about names with vowels?!!


def test_a_name_WITH_vowels
  shell_output = ""
  IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type brt ..close it and save the output
    pipe.puts("brat") #this is what you want it to print
    pipe.close_write
    shell_output = pipe.read
  end
  expected_output = <<EOS
What's your name?
Give me a.. B
Give me a.. R
Give me an.. A
Give me a.. T
EOS
    assert_equal shell_output, expected_output
  end
end
