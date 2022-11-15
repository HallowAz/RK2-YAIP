# frozen_string_literal: true

require 'test_helper'

class RkControllerTest < ActionDispatch::IntegrationTest
  test 'should get input' do
    get rk_input_url
    assert_response :success
  end

  test 'should get view' do
    get rk_view_url
    assert_response :success
  end
end
