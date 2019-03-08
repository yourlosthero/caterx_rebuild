require 'test_helper'

class CaterersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @caterer = caterers(:one)
  end

  test "should get index" do
    get caterers_url
    assert_response :success
  end

  test "should get new" do
    get new_caterer_url
    assert_response :success
  end

  test "should create caterer" do
    assert_difference('Caterer.count') do
      post caterers_url, params: { caterer: { code: @caterer.code, email: @caterer.email, location: @caterer.location, logo: @caterer.logo, mobile_1: @caterer.mobile_1, mobile_2: @caterer.mobile_2, mobile_3: @caterer.mobile_3, name: @caterer.name, password: @caterer.password, resend: @caterer.resend, tagline: @caterer.tagline, tel_1: @caterer.tel_1, tel_2: @caterer.tel_2, tel_3: @caterer.tel_3, uid: @caterer.uid, verified: @caterer.verified } }
    end

    assert_redirected_to caterer_url(Caterer.last)
  end

  test "should show caterer" do
    get caterer_url(@caterer)
    assert_response :success
  end

  test "should get edit" do
    get edit_caterer_url(@caterer)
    assert_response :success
  end

  test "should update caterer" do
    patch caterer_url(@caterer), params: { caterer: { code: @caterer.code, email: @caterer.email, location: @caterer.location, logo: @caterer.logo, mobile_1: @caterer.mobile_1, mobile_2: @caterer.mobile_2, mobile_3: @caterer.mobile_3, name: @caterer.name, password: @caterer.password, resend: @caterer.resend, tagline: @caterer.tagline, tel_1: @caterer.tel_1, tel_2: @caterer.tel_2, tel_3: @caterer.tel_3, uid: @caterer.uid, verified: @caterer.verified } }
    assert_redirected_to caterer_url(@caterer)
  end

  test "should destroy caterer" do
    assert_difference('Caterer.count', -1) do
      delete caterer_url(@caterer)
    end

    assert_redirected_to caterers_url
  end
end
