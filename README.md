# アプリケーション名
### 『くらふ』

# アプリケーション概要

### アプリケーションの語源
- **cla**ss(学級) + **fu**ll(満ちる)
- **暮ら**す + **ふ**れあい

### 想い
- 学級の友達同士の触れ合う機会を増やしたい。
- チャットでのやりとりを通して、キーボード入力を自然に覚えてほしい。
- 学級での様子を保護者にも気楽に見ていただくことで、各家庭で自然に学校の話をしてほしい。
- 学級担任は手軽にクラスの様子を発信することで、保護者との信頼関係を築いてほしい。
- 毎日の宿題を学級担任の手間なく確認できるようにしたい。

### アプリケーションの目的
- 学級の全員と気軽にメッセージのやりとりができる。
- メッセージのやりとりを通じて、SNSの使い方やリテラシーを学ぶことができる。
- ITリテラシーの指導に役立てる。

### URL
- http://aws-clafu.com

# 利用方法
- 『ゲストログイン（閲覧用）』からログインして機能をご確認ください。

# 目指した課題解決
- 小学生がスマホを持つようになり、SNSを介したトラブルが増えてきた。
- ITリテラシーのないまま、インターネットを使う小学生が増えてきた。
- 教員が手軽にクラスの様子を伝える手段がない。

# 洗い出した要件
- 学校登録機能
- 学級登録機能
- ユーザー登録機能
- チャット機能(メッセージ・画像送信)
- 学級通信投稿機能
- マイページ編集機能

# 実装予定の機能
- 宿題提出機能
- 管理者設定
- 管理者へのダイレクトメッセージ
- 保護者の閲覧許可

# 使用した技術
- Ruby 2.6.5
- Ruby on Rails 6.0.0
- HTML&CSS
- RSpec
- devise
- AWS(EC2,S3)


# テーブル設計

## Schoolsテーブル 

| Column | Type   | Options                   |
| ------ | ------ | ------------------------- |
| name   | string | null: false, unique: true |

### Association

has_many :class_rooms  


## Class_roomsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| school         | references | null: false, foreign_kye: true |
| grate          | integer    | null: false                    |
| class_number   | integer    | null: false                    |
| class_goals    | storing    |                                |

### Association

belongs_to :school  
has_many :users  
has_many :messages  
has_many :posts  

## Usersテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| first_name        | string     | null: false                    |
| last_name         | string     | null: false                    |
| nickname          | string     | null: false                    |
| attendance_number | integer    | null: false                    |
| email             | string     | null: false, unique: true      |
| password          | string     | null: false                    |
| class_room        | references | null: false, foreign_kye: true |

### Association

belongs_to :class_room  
has_many :messages  


## Messagesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| content        | string     |                                |
| user           | references | null: false, foreign_kye: true |
| class_room     | references | null: false, foreign_kye: true |

### Association
belongs_to :class_room  
belongs_to :user  

## Postsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| text       | string     | null: false                    |
| class_room | references | null: false, foreign_kye: true |

### Association
belongs_to :class_room  

# ローカルでの動作方法