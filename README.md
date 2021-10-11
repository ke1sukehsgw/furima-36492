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

### Association

- has_many :items
- has_many :buys

## Itemsテーブル

| Column        | Type        | Options                        |
| ------------- | ----------- | ------------------------------ |
| image         | string      | null: false                    |
| item_name     | string      | null: false                    |
| explanation   | text        | null: false                    |
| category      | text        | null: false                    |
| condition     | text        | null: false                    |
| delivery_fee  | integer     | null: false                    |
| shipping_area | text        | null: false                    |
| shipping_day  | text        | null: false                    |
| price         | integer     | null: false                    |
| user          | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## Buysテーブル

| Column       | Type       | Options                        |
| ------------ | -----------| ------------------------------ |
| item_name    | string     | null: false                    |
| image        | string     | null: false                    |
| price        | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :delivery

### Deliveryテーブル

| Column              | Type | Options     |
| ------------------- | -----| ------------|
| address             | text | null: false |
| postal_code         | text | null: false |
| prefectures         | text | null: false |
| municipalities      | text | null: false |
| house_number        | text | null: false |
| building_name       | text |             |
| telephone_number    | text | null: false |

### Association

- has_one :buy