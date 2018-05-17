require 'rails_helper'

RSpec.describe Admin::SkillsController, type: :controller do
  include Devise::Test::ControllerHelpers


  # See https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-%28and-RSpec%29
  def create_session(role_name)
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in FactoryBot.create(:user, :with_role, role_name: role_name)
  end

  describe 'GET administrate skills index' do
    it 'as an administrator, returns a success response' do
      get :index, params: {}, session: create_session('administrator')
      expect(response).to be_success
    end

    it 'as an administrator, returns a success response' do
      expect{get :index, params: {}, session: create_session('administrator')}
          .to_not raise_error
    end

    it 'as an end_user, raises CanCan::AccessDenied' do
      expect{get :index, params: {}, session: create_session('end_user')}
          .to raise_error(CanCan::AccessDenied)
    end
  end
end