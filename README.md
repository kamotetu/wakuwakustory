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

# wakuwakustory DB設計

## usersテーブル

|nickname|string|null :false|
|email|string|null :false|
|user_icon_image|string||

### Association
- has_many storys

## storysテーブル
|title|string|null :false|
|story|text|null :false|
|user_id|bigint|null :false, foreign_key: true|

### Association
- belongs_to user
- has_many comments
- has_many tags, through: storys_tags

## tagsテーブル
|tag|string||

### Association
- has_many storys, through: storys_tags


## story_tagsテーブル
|story_id|bigint|null :false, foreign_key: true|
|tag_id|bigint|null :false, foreign_key: true|

### Association
- belongs_to user
- belongs_to story

## commentsテーブル
|comment|string||
|user_id|bigint|null :false, foreign_key: true|
|story_id|bigint|null :false, foreign_key: true|
### Association
- belongs_to story
- belongs_to user
