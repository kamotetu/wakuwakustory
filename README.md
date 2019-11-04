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

![wakusuto_main_image](https://user-images.githubusercontent.com/54009505/68096905-3b7dfb00-fef7-11e9-8d53-5dd484186aa5.png)

 このサービスはブログや、オリジナルの小説やエッセイなど様々なジャンルを投稿して、シェアできるサービスです

## 使い方

### ログイン、ログアウト

### 検索機能

![index_view](https://user-images.githubusercontent.com/54009505/68098615-f8288a00-ff00-11e9-941a-dddc1a603ad8.jpeg)

ワードやジャンルから検索可能です






