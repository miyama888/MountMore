require 'rails_helper'

RSpec.describe 'Articleモデルのテスト', type: :model do
		let(:user) { create(:user) }
		let(:article) { Article.new(user_id: user.id) }
	describe 'バリデーションのテスト' do
		context 'titleカラム' do
			it '空欄でないこと' do
				article.title = ''
				expect(article.valid?).to eq false;
			end
		end
		context 'bodyカラム' do
			it '空欄でないこと' do
				article.body = ''
				expect(article.valid?).to eq false;
			end
			it '500文字以下であること' do
				article.body = Faker::Lorem. characters(number:501)
				expect(article.valid?).to eq false;
			end
		end
	end
	describe 'アソシエーションのテスト' do
		context 'Userモデルとの関係' do
			it 'N:1となっている' do
				expect(Article.reflect_on_association(:user).macro).to eq :belongs_to;
			end
		end
	end

end
