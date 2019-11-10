# README

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
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_ruby|string|null: false|
|family_name_ruby|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|

### Association
- has_one :user_profile
- has_one :user_adress
- has_one :authentication
- has_many :sns_authentications
- has_many :user_cards
- has_many :reviews
- has_many :likes
- has_many :comments
- has_many :orders
- has_many :items

## user_profilesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|nickname|string|null: false|
|introduction|text||
|image|string||

### Association
- belongs_to :user

## user_adress

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

## authenticationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|authentic_phone_number|integer|null: false, unique: true|

### Association
- belongs_to :user

## sns_authenticationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|provider|string|null: false|
|uid|string|null: false|

### Association
- belongs_to :user

## user_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|?|?|?|

### Association
- belongs_to :user

