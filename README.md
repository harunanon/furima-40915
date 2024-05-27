# データベース設計

## userテーブル（ユーザー管理機能）

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null:false               |
| email              | string | null:false, unique: true |
| encrypted_password | string | null:false               |
| first_name         | string | null:false               |
| last_name          | string | null:false               |
| first_name_kana    | string | null:false               |
| last_name_kana     | string | null:false               |
| birth_date         | date   | null:false               |

### Association
- has_many :items
- has_many :histories

## itemsテーブル（商品出品機能）

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| name                 | string     | null:false                    |
| text                 | text       | null:false                    |
| genre_id             | integer    | null:false                    |
| quality_id           | integer    | null:false                    |
| payment_id           | integer    | null:false                    |
| region_of_origin_id  | integer    | null:false                    |
| delivery_day_id      | integer    | null:false                    |
| price                | integer    | null:false                    |
| user                 | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- has_one :history
- has_one_attached :image (ActiveStorageで実装)

## historiesテーブル（購入履歴機能）

| Column   | Type       | Options                       |
| -------- | ---------- | ----------------------------- |
| user     | references | null:false, foreign_key: true |
| item     | references | null:false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :purchase

## purchasesテーブル（商品購入機能）

| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| post_code            | string     | null:false                    |
| region_of_origin_id  | integer    | null:false                    |
| municipality         | string     | null:false                    |
| street_address       | string     | null:false                    |
| building_name        | string     |                               |
| phone_number         | string     | null:false                    |
| history              | references | null:false, foreign_key: true |

### Association
- belongs_to :history