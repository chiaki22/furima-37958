# テーブル設計

## users テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| nickname                | string | null: false              |
| email                   | string | null: false, unique:true |
| password                | string | null: false              |
| password_confirmation   | string | null: false              |
| last_name               | string | null: false              |
| first_name              | string | null: false              |
| last_name_kana          | string | null: false              |
| first_name_kana         | string | null: false              |
| birth_date              | string | null: false              |

### Association

- has_many :sells
- has_many :buys

## sells テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | string     | null: false                    |
| item_name          | string     | null: false                    |
| item_info          | text       | null: false                    |
| item_category      | integer    | null: false                    |
| item_status        | integer    | null: false                    |
| shipping_fee       | integer    | null: false                    |
| prefecture         | integer    | null: false                    |
| scheduled_delivery | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| sell   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :sell
- has_one :address

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| phone       | integer    | null: false                    |
| buy         | references | null: false, foreign_key: true |

### Association

- belongs_to :buy
