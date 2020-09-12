# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Area.create!(
	id: 1,
	area_name: '北海道地方'
	)
Area.create!(
	id: 2,
	area_name: '東北地方'
	)
Area.create!(
	id: 3,
	area_name: '関東地方'
	)
Area.create!(
	id: 4,
	area_name: '中部地方'
	)
Area.create!(
	id: 5,
	area_name: '近畿地方'
	)
Area.create!(
	id: 6,
	area_name: '中国地方'
	)
Area.create!(
	id: 7,
	area_name: '四国地方'
	)
Area.create!(
	id: 8,
	area_name: '九州地方'
	)

Prefecture.create!([
{
	area_id: 1,
	prefecture_name: '北海道'
},
{
	area_id: 2,
	prefecture_name: '青森県'
},
{
	area_id: 2,
	prefecture_name: '秋田県'
},
{
	area_id: 2,
	prefecture_name: '岩手県'
},
{
	area_id: 2,
	prefecture_name: '山形県'
},
{
	area_id: 2,
	prefecture_name: '宮城県'
},
{
	area_id: 2,
	prefecture_name: '福島県'
},
{
	area_id: 3,
	prefecture_name: '東京都'
},
{
	area_id: 3,
	prefecture_name: '埼玉県'
},
{
	area_id: 3,
	prefecture_name: '神奈川県'
},
{
	area_id: 3,
	prefecture_name: '千葉県'
},
{
	area_id: 3,
	prefecture_name: '群馬県'
},
{
	area_id: 3,
	prefecture_name: '栃木県'
},
{
	area_id: 3,
	prefecture_name: '茨城県'
},
{
	area_id: 4,
	prefecture_name: '愛知県'
},
{
	area_id: 4,
	prefecture_name: '新潟県'
},
{
	area_id: 4,
	prefecture_name: '長野県'
},
{
	area_id: 4,
	prefecture_name: '山梨県'
},
{
	area_id: 4,
	prefecture_name: '静岡県'
},
{
	area_id: 4,
	prefecture_name: '富山県'
},
{
	area_id: 4,
	prefecture_name: '岐阜県'
},
{
	area_id: 4,
	prefecture_name: '石川県'
},
{
	area_id: 4,
	prefecture_name: '福井県'
},
{
	area_id: 5,
	prefecture_name: '大阪府'
},
{
	area_id: 5,
	prefecture_name: '京都府'
},
{
	area_id: 5,
	prefecture_name: '兵庫県'
},
{
	area_id: 5,
	prefecture_name: '奈良県'
},
{
	area_id: 5,
	prefecture_name: '和歌山県'
},
{
	area_id: 5,
	prefecture_name: '三重県'
},
{
	area_id: 5,
	prefecture_name: '滋賀県'
},
{
	area_id: 6,
	prefecture_name: '鳥取県'
},
{
	area_id: 6,
	prefecture_name: '島根県'
},
{
	area_id: 6,
	prefecture_name: '岡山県'
},
{
	area_id: 6,
	prefecture_name: '広島県'
},
{
	area_id: 6,
	prefecture_name: '山口県'
},
{
	area_id: 7,
	prefecture_name: '香川県'
},
{
	area_id: 7,
	prefecture_name: '徳島県'
},
{
	area_id: 7,
	prefecture_name: '愛媛県'
},
{
	area_id: 7,
	prefecture_name: '高知県'
},
{
	area_id: 8,
	prefecture_name: '福岡県'
},
{
	area_id: 8,
	prefecture_name: '大分県'
},
{
	area_id: 8,
	prefecture_name: '宮崎県'
},
{
	area_id: 8,
	prefecture_name: '長崎県'
},
{
	area_id: 8,
	prefecture_name: '佐賀県'
},
{
	area_id: 8,
	prefecture_name: '熊本県'
},
{
	area_id: 8,
	prefecture_name: '鹿児島県'
},
{
	area_id: 8,
	prefecture_name: '沖縄県'
}
])

