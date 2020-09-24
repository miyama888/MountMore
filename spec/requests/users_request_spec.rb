require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe '新規登録ページ' do
    context "新規登録ページが正しく表示される。" do
      before do
        get new_user_registration_path
      end

      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
      it 'タイトルが正しく表示されていること' do
        expect(response.body).to include("新規登録")
      end
    end
  end
end
