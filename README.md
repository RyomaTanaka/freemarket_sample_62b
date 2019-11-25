# README test
 
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_ruby|string|null: false|
|family_name_ruby|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
- has_one :profile, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :sns_authentications, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :points, dependent: :destroy
- has_many :reviews, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :buyer_orders, class_name: 'Order', foreign_key: buyer_id, dependent: :destroy
- has_many :seller_orders, class_name: 'Order', foreign_key: seller_id, dependent: :destroy
- has_many :items, dependent: :destroy

### index
- add_index :users, [:first_name, :family_name]
- add_index :users, [:first_name_ruby, :family_name_ruby]
- add_index :users, :email
- add_index :users, :pass_word
- add_index :users, [:birth_year, :birth_month, :birth_day]

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|introduction|text||
|image|string||

### Association
- belongs_to :user

### index
- add_index :users, :nickname

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|post_number|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|integer||

### Asociation
- belongs_to :user

## sns_authenticationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|provider|string|null: false|
|uid|string|null: false|

### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|score|integer|null: false|

### Association
- belongs_to :user

## reviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|body|text||
|rate|integer|null: false|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|name|string|null: false|
|body|text|null: false|
|price|integer|null: false|
|condition|string|null: false|
|shipping_id|references|null: false, foreign_key: true|
|status|integer|null: false|
|order_status|integer|null: false|
|prefecture|string|null: false|
|method|string||
|cost_burden|string|null: false|
|period_before_shipping|string|null: false|

### Association
- has_many :images, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_one :order, dependent: :destroy
- belongs_to :user
- belongs_to :category

### index
- add_index :items, :name
- add_index :items, :body
- add_index :items, :price

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item

### index
- add_index :images, :image


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
- has_many :messages

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|order_id|references|null: false, foreign_key: true|
|body|text|null: false|

### Association
- belongs_to :order

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## commnentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|body|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|parent_id|references|foreign_key: true|

### Association
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: parent_id
- has_many :items