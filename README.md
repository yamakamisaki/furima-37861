## usersテーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| nickname            | string  | null: false |
| email               | string  | null: false | unique: true |
| encrypted_password  | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_kana     | string  | null: false |
| last_name_kana      | string  | null: false |
| birthday            | date    | null: false |


### Association
- has_many :items
- has_many :buyers



## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false |
| text           | text       | null: false |
| category_id    | integer    | null: false |
| condition_id   | integer    | null: false |
| shipping_fee_id| integer    | null: false |
| prefecture_id  | integer    | null: false |
| send_day_id    | integer    | null: false |
| price          | integer    | null: false |
| user           | references | foreign_key: true | null: false |

＊image = Active Storage 使用のためカラム追加なし
＊category/condition/shipping_fee/prefectures/send_day = ActiveHash 使用のため integer で取得

### Association
- belongs_to :user
- has_one_attached :image
- has_one :buyer



## buyersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | foreign_key: true | null: false |
| item   | references | foreign_key: true | null: false |




### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| postal_code        | string    | null: false |
| prefecture_id      | integer   | null: false |
| city               | string    | null: false |
| home_address       | string    | null: false |
| building_name      | string    | 
| telephone_number   | string    | null: false |
| buyer              | references| foreign_key: true | null: false |

＊building_name のみ 空欄可

### Association
- belongs_to :buyer
