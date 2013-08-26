require './test/test_helper'
require 'exercism/testrunner'

class TestSuiteTest < Minitest::Test

  def test_testrunner_captures_stdout
     stdout, _, _  = Exercism::TestRunner.run_command "echo 'hello world'"
     assert stdout == "hello world\n"
  end

  def test_testrunner_captures_stderr
      _, stderr, _ = Exercism::TestRunner.run_command "echo error >&2"
      assert stderr == "error\n"
  end

  def test_testrunner_captures_exit_code
       _, _, exit = Exercism::TestRunner.run_command "echo 'hello world'"
       assert exit == 0
 
       _, _, exit = Exercism::TestRunner.run_command "grep"
       assert exit != 0
  end
end
