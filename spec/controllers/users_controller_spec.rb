require 'rails_helper'

RSpec.describe Api::UsersController do
  describe 'GET show' do
    context 'user does not exist' do
      it 'returns not found' do
        get :show, id: 1
        expect(response.status).to be(404)
      end
    end
  end
end
