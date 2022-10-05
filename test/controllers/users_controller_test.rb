require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { about_company: @user.about_company, application_count: @user.application_count, birthdate: @user.birthdate, company_name: @user.company_name, company_url: @user.company_url, education: @user.education, email: @user.email, job_title: @user.job_title, jobs_count: @user.jobs_count, linked_url: @user.linked_url, name: @user.name, password_digest: @user.password_digest, phone: @user.phone, professional_experience: @user.professional_experience, role: @user.role, token: @user.token } }, as: :json
    end

    assert_response :created
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { about_company: @user.about_company, application_count: @user.application_count, birthdate: @user.birthdate, company_name: @user.company_name, company_url: @user.company_url, education: @user.education, email: @user.email, job_title: @user.job_title, jobs_count: @user.jobs_count, linked_url: @user.linked_url, name: @user.name, password_digest: @user.password_digest, phone: @user.phone, professional_experience: @user.professional_experience, role: @user.role, token: @user.token } }, as: :json
    assert_response :success
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user), as: :json
    end

    assert_response :no_content
  end
end
