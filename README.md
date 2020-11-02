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