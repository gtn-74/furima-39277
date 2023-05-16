## usersテーブル

| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| nickname            | string     | not null                       |
| email               | string     | not null  ユニーク制約           |
| encrypted_password  | string     | not null                       |
| family_name         | string     | not null                       |
| first_name          | string     | not null                       |
| family_name_kana    | string     | not null                       |
| first_name_kana     | string     | not null                       |
| birth_day           | date       | not null                       |


### Association
- has_many :items
- has_many :oders

## itemテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| name                | string     | not null                       |
| text                | text       | not null                       |
| category            | string     | not null                       |
| sales-status        | string     | not null                       |
| shopping-fee-status | string     | not null                       |
| prefecture          | string     | not null                       |
| scheduled-delivery  | string     | not null                       |
| price               | integer    | not null                       |
| user                | references | not null 外部キ-                |

### Association
- belongs_to :user
- has_many :oders
- has_one_attached :image

## oderテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| card_number         | integer    | not null                       |
| expiry              | integer    | not null                       |
| cvc                 | integer    | not null                       |
| item                | references | not null 外部キ-                |
| user                | references | not null 外部キ-                |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :oder-information

## oder-informationテーブル
| Column              | Type       | Options                        |
| ------------------  | ---------- | ------------------------------ |
| postal code         | string     | not null                       |
| prefectures         | string     | not null                       |
| city                | string     | not null                       |
| address             | string     | not null                       |
| building_name       | string     |                                |
| phone_number        | string     |                                |
| user                | references | not null 外部キ-                |

### Association
- belongs_to :
- has_one:oder