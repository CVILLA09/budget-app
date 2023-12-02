require 'rails_helper'

RSpec.describe '/purchases', type: :request do
  describe 'GET /index' do
    before do
      @user = FactoryBot.create(:user)
      @category = FactoryBot.create(:category)
      @category.users << @user
      @purchase = FactoryBot.create(:purchase, category: @category)
    end
    before(:each) { sign_in @user }

    it 'returns a successful response' do
      get category_path(@category)
      expect(response).to have_http_status(200)
    end

    it 'correct template is rendered' do
      get category_path(@category)
      expect(response).to render_template(:show)
    end

    it 'includes a link to add a new purchase' do
      get category_path(@category)
      expect(response.body).to include(new_category_purchase_path(@category))
    end
  end
end
