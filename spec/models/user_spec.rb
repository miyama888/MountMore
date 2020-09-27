require 'rails_helper'
I18n.locale = :ja
Faker::Config.locale = :ja
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
    context 'first_name' do
      it '空欄でないこと'do
        user.first_name = ''
        is_expected.to eq false
      end
    end
    context 'last_name' do
      it '空欄でないこと'do
        user.last_name = ''
        is_expected.to eq false
      end
    end


    context 'introductionカラム' do
      it '60文字以下であること' do
        user.introduction = Faker::Lorem.characters(number:61)
        is_expected.to eq false
      end
      it '60文字ではバリデーションがかからないこと' do
        user.introduction = Faker::Lorem.characters(number:60)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Articleモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:articles).macro).to eq :has_many
      end
    end
  end
end
