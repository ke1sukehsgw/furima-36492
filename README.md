# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Usersテーブル

| Column                               | Type   | Options                   |
| ------------------------------------ | -------| ------------------------- |
| nickname                             | string | null: false               |
| email                                | string | null: false, unique: true |
| encrypted_password                   | string | null: false               |
| last_name                            | string | null: false               |
| first_name                           | string | null: false               |
| last_name_kana                       | string | null: false               |
| first_name_kana                      | string | null: false               |
| birthday                             | date   | null: false               |

### Association

- has_many :items
- has_many :buys

## Itemsテーブル

| Column           | Type        | Options                        |
| ---------------- | ----------- | ------------------------------ |
| item_name        | string      | null: false                    |
| explanation      | text        | null: false                    |
| category_id      | integer     | null: false                    |
| condition_id     | integer     | null: false                    |
| delivery_fee_id  | integer     | null: false                    |
| shipping_area_id | integer     | null: false                    |
| shipping_day_id  | integer     | null: false                    |
| price            | integer     | null: false                    |
| user             | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## Buysテーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
= has_one :item
- has_one :delivery

### Deliveryテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| address             | string     | null: false                    |
| postal_code         | string     | null: false                    |
| prefectures_id      | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| house_number        | string     | null: false                    |
| building_name       | string     |                                |
| telephone_number    | string     | null: false                    |
| buy                 | references | null: false, foreign_key: true |

### Association

- has_one :buy