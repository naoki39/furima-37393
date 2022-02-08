#テーブル設計

#usersテーブル
| Column      | Type   | Option      |
| ----------- | ------ | ----------- |
| email       | string | null: false |
| password    | string | null: false |
| nickname    | string | null: false |
| first_name  | string | null: false |
| last_name   | string | null: false |
| birthday    | string | null: false |


#itemsテーブル
| Column      | Type | Option |
| ---------------- | ---------- |------------------------------- |
| name             | string     | null: false                    |  
| text             | text       | null: false                    |
| category         | string     | null: false                    |
| state            | string     | null: false                    |
| delivery_charge  | integer    | null: false                    |
| shipping_area    | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| price            | integer    | null: false                    | 
| user             | references | null: false, foreign_key: true |


#commentsテーブル
| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| content  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |


#creditsテーブル
| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| card_number    | string     | null: false                    |
| effective_date | string     | null: false                    |
| security_code  | string     | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |


#adressesテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     | null: false                    |
| telephone_number | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| credit           | references | null: false, foreign_key: true |