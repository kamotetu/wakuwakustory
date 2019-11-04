# README

# DB

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null :false|
|email|string|null :false|
|my_image|string||
|profile_text|text||

### Association
- has_many :storys
- has_many :maintitles

## storiesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null :false|
|story|text|null :false|
|user_id|integer|null :false, foreign_key: true|
|maintitle_id|bigint|foreign_key: true|
|image|string||
|image_explanatiln|string||

### Association
- belongs_to :user
- belongs_to :maintitle
- has_many comments, dependent: :destroy


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string||
|user_id|bigint|null :false, foreign_key: true|
|story_id|bigint|null :false, foreign_key: true|

### Association
- belongs_to :story
- belongs_to :user

## maintiltesテーブル
|Column|Type|Options|
|------|----|-------|
|maintitle|string|null :false|
|genre|integer|null :false|
|explanation|text||
|user_id|bigint|foregn_key: true|

### Association
- has_many :stories
- has_many :favorites
- has_many :users, through: :favorites

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|foregn_key: true|
|maintitle_id|bigint|foregn_key: true|

### Association
- belongs_to :user
- belongs_to :maintitle



# Thank you for reading Readme!

### このサービスはブログや、オリジナルの小説やエッセイなどを投稿して、シェアできるサービスです

## 使い方



