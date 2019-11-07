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

![index_mainimage](https://user-images.githubusercontent.com/54009505/68370029-eeac5580-017e-11ea-9198-0ad14aaa337d.png)

このサービスはオリジナルの小説を投稿して、シェアできるサービスです

### 投稿機能
- 新規登録、ログイン後、サイドメニューからマイページに移動
  - 「新しく小説を書く」をクリックし、タイトル登録ページへ
  - 必須項目、任意項目を入力し「登録する」をクリックし、小説投稿ページへ
  - 必須項目、任意項目を入力し、「投稿する」をクリックすれば投稿完了

### お気に入り機能
気になった小説にはお気に入り登録が可能です

<img width="1381" alt="okiniiri2" src="https://user-images.githubusercontent.com/54009505/68099685-0d081c00-ff07-11e9-996e-2a9267c97486.png">

サイドメニュー「お気に入り一覧」からお気に入りを確認できます


### 検索機能

![search_area](https://user-images.githubusercontent.com/54009505/68370648-54e5a800-0180-11ea-8650-7ea02c0e092a.jpeg)

ワードやジャンルから検索可能です（現在一単語のみ）


### 追加予定機能
- テキストフォームへの画像投稿機能
- 複数ワードでの検索機能
- 評価機能

追加予定日はまだはっきりしませんが、鋭意開発中です


### 開発した理由

「誰かの暇つぶし」
「誰かの夢を応援する」
この２つのコンセプトを実現できるサービスを開発したいと考え、その中で、

「オリジナルの小説を投稿し、シェアするサービスというのは少ないのでは？」と考え開発に至りました。

WakuwakuStoryは、「小説」にスポットをあてることで、小説を趣味で書いてみたい、または小説家を目指している方の腕試し、また、それ以外の方の「暇つぶし」に一役かえたらなによりと感じています。


## So Enjoy WakuwakuStory!






