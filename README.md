# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :order_logs

## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| item_image       | string     | null: false |
| item_name        | string     | null: false |
| explanation      | text       | null: false |
| category         | integer    | null: false |
| status           | integer    | null: false |
| shipping_charges | integer    | null: false |
| shipment_source  | integer    | null: false |
| days_to_ship     | integer    | null: false |
| price            | integer    | null: false |
| order_log        | references | null: false |

### Association

- belongs_to :user
- has_one :order

## order_logs テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order_address

## order_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| municipality   | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |


### Association

- belongs_to :order_log
