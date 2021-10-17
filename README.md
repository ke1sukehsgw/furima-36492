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
| encrypted_password_confirmation      | string | null: false               |
| last_name                            | string | null: false               |
| first_name                           | string | null: false               |
| last_name(kana)                      | string | null: false               |
| first_name(kana)                     | string | null: false               |
| birthday                             | string | null: false               |

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
| user_id          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## Buysテーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| item_id      | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :delivery

### Deliveryテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| address             | text       | null: false                    |
| postal_code         | text       | null: false                    |
| prefectures_id      | integer    | null: false                    |
| municipalities      | text       | null: false                    |
| house_number        | text       | null: false                    |
| building_name       | text       |                                |
| telephone_number    | text       | null: false                    |
| buy_id              | references | null: false, foreign_key: true |

### Association

- has_one :buy