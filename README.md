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

### 投稿機能
- 新規登録、ログイン後、サイドメニューから
  - 「新しく開設する」をクリックし、開設ページへ
  - 必須項目、任意項目を入力し「登録する」をクリックし、記事投稿ページへ
  - 必須項目、任意項目を入力し、「投稿する」をクリックすれば投稿完了

### お気に入り機能
気になった開設にはお気に入り登録が可能です

<img width="1381" alt="okiniiri2" src="https://user-images.githubusercontent.com/54009505/68099685-0d081c00-ff07-11e9-996e-2a9267c97486.png">

サイドメニュー「お気に入り一覧」からお気に入りを確認できます


### 検索機能

![index_view](https://user-images.githubusercontent.com/54009505/68098615-f8288a00-ff00-11e9-941a-dddc1a603ad8.jpeg)

ワードやジャンルから検索可能です（現在一単語のみ）


### 追加予定機能
- テキストフォームへの画像投稿機能
- 複数ワードでの検索機能
- ジャンル「漫画」の実装
- 評価機能

追加予定日はまだはっきりしませんが、鋭意開発中です


### 開発した理由

”自分の頭の中にある物語をシェアできるサービス”を開発したかったからです。

なぜかというと、ブログをシェアするのは今や当たり前ですが、自分で考えた小説などの物語を投稿し、シェアするサービスというのは少ないのでは？と考え開発に至りました。

世の中にはいろんな才能を持った方が大勢います。
その中で、小説
WakuwakuStoryは、そんな夢
また文章として投稿するなら、文章で表現できる様々なジャンルも同時に投稿できればと思い、エッセイやコラムなんかのジャンルもつけました。
小説を書いてみたいけど、出版までは敷居が高くて自身がない・・という方でも、このサービスを利用し、簡単に公開することができます。
また、読者からのコメントで作品の評価がダイレクトで伝わるので、腕試しなどで利用してもらうのもいいでしょう。
そんな
現在はインターネットから世に出るのが当たり前の時代ですので、このサービスを利用し、利用者の才能を
このサービスを利用すれば簡単にオリジナルの小説などを公開、シェアできます。
また、作品に対する読者のコメントにより、作品の感想や、評価などダイレクトに反応がわかります。
このサービスを通じ、みなさんの隠れた才能を発見していただければ
自分の中の物語をシェアし、誰かの”暇つぶし”になればいいなと感じています。

## So Enjoy WakuwakuStory!






