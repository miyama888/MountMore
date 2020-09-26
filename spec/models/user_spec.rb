require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { User.new }
    subject { user.valid? }


    context 'user_nameカラム' do
      it '空欄でないこと' do
        user.user_name = ''
        is_expected.to eq false
      end
    end
    context ''
  end

  describe 'アソシエーションのテスト' do
    context 'Articleモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:articles).macro).to eq :has_many
      end
    end
  end
end
