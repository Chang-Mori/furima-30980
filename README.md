# README

# テーブル設計

## users テーブル

| Column 　　　   | Type   | Options                   |
| -------------- | ------ | ------------------------- |
| nickname       | string | null: false               |
| email          | string | null: false, unique: true |
| password       | string | null: false               |
| first_name     | string | null: false               |
| family_name    | string | null: false               |
| birthday_year  | string | null: false               |
| birthday_month | string | null: false               |
| birthday_day   | string | null: false               |

### Association

- has_many :items
- has_many :order_logs

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_image       | string     | null: false |
| item_name        | string     | null: false |
| explanation      | text       | null: false |
| category         | string     | null: false |
| status           | string     | null: false |
| shipping_charges | string     | null: false |
| shipment_source  | string     | null: false |
| days_to_ship     | string     | null: false |
| price            | string     | null: false |
| order_log        | references | null: false |

### Association

- belongs_to :user
- has_one :order

## order_logs テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| order_date   | string     | null: false                    |
| order_item   | string     | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :order_address

## order_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| address_number | string     | null: false                    |
| city           | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |


### Association

- belongs_to :order_log
