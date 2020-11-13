# アプリケーション名
### 『くらふ』
# アプリケーション概要
### アプリケーションの語源
- **cla**ss(学級) + **fu**ll(満ちる)
- **暮ら**す + **ふ**れあい

### アプリケーションの目的
- 学級の全員と気軽にメッセージのやりとりができる。
- メッセージのやりとりを通じて、SNSの使い方やリテラシーを学ぶことができる。
- ITリテラシーの指導に役立てる。

# URL
# テスト用アカウント
# 利用方法
# 目指した課題解決
- 小学生がスマホを持つようになり、SNSを介したトラブルが増えてきた。
- ITリテラシーのないまま、インターネットを使う小学生が増えてきた。
- 教員が手軽にクラスの様子を伝える手段がない。
# 洗い出した要件
- 学校登録機能
- 学級登録機能
- ユーザー登録機能
- メッセージ投稿機能
- 画像投稿機能

# 実装した機能についてのGIFと説明
# 実装予定の機能
- 管理者設定
- 管理者へのダイレクトメッセージ
- 保護者の閲覧許可


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

# ローカルでの動作方法