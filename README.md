#テーブル設計

#usersテーブル
| Column             | Type   | Option                    |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |   
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               | 
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_histories


#itemsテーブル
| Column              | Type       | Option                         |
| ----------------    | ---------- |------------------------------- |
| name                | string     | null: false                    |  
| info                | text       | null: false                    |
| category_id         | integer    | null: false                    |
| state_id            | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| shipping_area_id    | integer    | null: false                    |
| shipping_day_id     | integer    | null: false                    |
| price               | integer    | null: false                    | 
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_history


#purchase_historiesテーブル
| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


#addressesテーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | string     | null: false                    |
| building         | string     |                     
| telephone_number | string     | null: false                    |
| purchase_history | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase_history