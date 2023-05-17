## usersテーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| nickname            | string     | not null                       |
| email               | string     | not null  unique: true         |
| encrypted_password  | string     | not null                       |
| family_name         | string     | not null                       |
| first_name          | string     | not null                       |
| family_name_kana    | string     | not null                       |
| first_name_kana     | string     | not null                       |
| birth_day           | date       | not null                       |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| name                | string     | null false                     |
| text                | text       | null false                     |
| category_id         | integer    | null false                     |
| sales_id            | integer    | null false                     |
| shopping_id         | integer    | null false                     |
| prefecture_id       | integer    | null false                     |
| shopping_day_id     | integer    | null false                     |
| price               | integer    | null false                     |
| user_id             | references | null false  foreign_key: true  |

### Association
- belongs_to :user
- has_many :orders

## ordersテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| item_id             | references | null false  foreign_key: true  |
| user_id             | references | null false  foreign_key: true  |

### Association
- belongs_to :item
- belongs_to :user
- has_one :order_information


## order_informationsテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| order_id            | string     | null false                     |
| postal_code         | string     | null false                     |
| prefecture_id       | integer    | null false                     |
| city                | string     | null false                     |
| address             | string     | null false                     |
| building_name       | string     |                                |
| phone_number        | string     | null false                     |

### Association
- belongs_to :order