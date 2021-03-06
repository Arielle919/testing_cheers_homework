require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type brt ..close it and save the output
      pipe.puts("BRT") #this is what you want it to print
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a.. B
Give me a.. R
Give me a.. T
BRT's just GRAND!
EOS
    assert_equal expected_output, shell_output
  end

  def test_a_name_with_no_vowels_a_different_way
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("brt")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_includes_in_order shell_output, "What's your name?Give me a.. B", "Give me a.. R", "Give me a.. T"
  end

# Below are my test AA:)-------------------------------------------------?!!


def test_a_name_WITH_vowels
  shell_output = ""
  IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type BRAD ..close it and save the output
    pipe.puts("BRAD") #this is what you want it to print
    pipe.close_write
    shell_output = pipe.read
  end
  expected_output = <<EOS
What's your name?
Give me a.. B
Give me a.. R
Give me an.. A
Give me a.. D
BRAD's just GRAND!
EOS
    assert_equal  expected_output, shell_output
  end

  def test_if_name_has_spaces
  shell_output = ""
  IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type BRAD ..close it and save the output
    pipe.puts("BRAD PITT") #this is what you want it to print
    pipe.close_write
    shell_output = pipe.read
  end
  expected_output = <<EOS
What's your name?
Give me a.. B
Give me a.. R
Give me an.. A
Give me a.. D

Give me a.. P
Give me an.. I
Give me a.. T
Give me a.. T
BRAD PITT's just GRAND!
EOS
    assert_equal  expected_output, shell_output
  end

  def test_if_name_is_ALLCAPS
  shell_output = ""
  IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type BRAD ..close it and save the output
    pipe.puts("brad pitt") #this is what you want it to print
    pipe.close_write
    shell_output = pipe.read
  end
  expected_output = <<EOS
What's your name?
Give me a.. B
Give me a.. R
Give me an.. A
Give me a.. D

Give me a.. P
Give me an.. I
Give me a.. T
Give me a.. T
BRAD PITT's just GRAND!
EOS
    assert_equal  expected_output, shell_output
  end

    def test_if_no_name_input
  shell_output = ""
  IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type BRAD ..close it and save the output
    pipe.puts("") #this is what you want it to print
    pipe.close_write
    shell_output = pipe.read
  end
  expected_output = <<EOS
What's your name?
's just GRAND!
EOS
    assert_equal  expected_output, shell_output
  end

  def test_if_name_has_hyphen
  shell_output = ""
  IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type BRAD ..close it and save the output
    pipe.puts("O'Neal") #this is what you want it to print
    pipe.close_write
    shell_output = pipe.read
  end
  expected_output = <<EOS
What's your name?
Give me an.. O
____________'
Give me a.. N
Give me an.. E
Give me an.. A
Give me a.. L
O'NEAL's just GRAND!
EOS
    assert_equal  expected_output, shell_output
  end

  def test_if_user_input_invalid_character
  shell_output = ""
  IO.popen('ruby cheers.rb', 'r+') do |pipe|#run this program for me , and type BRAD ..close it and save the output
    pipe.puts("+-^%$") #this is what you want it to print
    pipe.close_write
    shell_output = pipe.read
  end
  expected_output = <<EOS
What's your name?
invalid
invalid
invalid
invalid
invalid
No Name's just GRAND!
EOS
    assert_equal  expected_output, shell_output
  end



end
