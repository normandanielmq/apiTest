require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  test "should get show_answers" do
    get :show_answers
    assert_response :success
  end

end
