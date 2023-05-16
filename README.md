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
- has_many :oders

## itemsテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| name                | string     | not null                       |
| text                | text       | not null                       |
| category_id         | integer    | not null                       |
| sales_id            | integer    | not null                       |
| shopping_id         | integer    | not null                       |
| prefecture_id       | integer    | not null                       |
| shopping-days_id    | integer    | not null                       |
| price               | integer    | not null                       |
| user                | references | not null foreign_key: true     |

### Association
- belongs_to :user

## odersテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| item                | references | not null foreign_key: true     |
| user                | references | not null foreign_key: true     |

### Association
- belongs_to :item
- belongs_to :oder-information

## oder-informationsテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| postal code         | string     | not null                       |
| prefecture_id       | integer    | not null                       |
| city                | string     | not null                       |
| address             | string     | not null                       |
| building_name       | string     | not null                       |
| phone_number        | string     | not null                       |
| user                | references | not null foreign_key: true     |

### Association
- has_one:oder