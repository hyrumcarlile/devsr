require 'test_helper'

class EndorsementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @endorsement = endorsements(:one)
  end

  test "should get index" do
    get endorsements_url
    assert_response :success
  end

  test "should get new" do
    get new_endorsement_url
    assert_response :success
  end

  test "should create endorsement" do
    assert_difference('Endorsement.count') do
      post endorsements_url, params: { endorsement: {  } }
    end

    assert_redirected_to endorsement_url(Endorsement.last)
  end

  test "should show endorsement" do
    get endorsement_url(@endorsement)
    assert_response :success
  end

  test "should get edit" do
    get edit_endorsement_url(@endorsement)
    assert_response :success
  end

  test "should update endorsement" do
    patch endorsement_url(@endorsement), params: { endorsement: {  } }
    assert_redirected_to endorsement_url(@endorsement)
  end

  test "should destroy endorsement" do
    assert_difference('Endorsement.count', -1) do
      delete endorsement_url(@endorsement)
    end

    assert_redirected_to endorsements_url
  end
end
