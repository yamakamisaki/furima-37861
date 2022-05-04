## userテーブル

| Column              | Type    | Options                        |
| ------------------- | ------- | ------------------------------ |
| email               | string  | null: false | unique: true |
| encrypted_password  | string  | null: false |
| first_name_hiragana | string  | null: false |
| last_name_hiragana  | string  | null: false |
| first_name_katakana | string  | null: false |
| last_name_katakana  | string  | null: false |
| nickname            | string  | null: false |
| birth_year          | integer | null: false |
| birth_month         | integer | null: false |
| birth_day           | integer | null: false |


### Association
- has_many :items
- has_many :buyers



## itemテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false |
| text        | text       | null: false |
| category    | integer    | null: false |
| condition   | integer    | null: false |
| shipping_fee| integer    | null: false |
| prefectures | integer    | null: false |
| send_day    | integer    | null: false |
| price       | integer    | null: false |
| user        | references | foreign_key: true | null: false |

＊image = Active Storage 使用のためカラム追加なし
＊category/condition/shipping_fee/prefectures/send_day = ActiveHash 使用のため integer で取得

### Association
- belongs_to :user
- has_one :buyer



## buyerテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | foreign_key: true | null: false |
| item   | references | foreign_key: true | null: false |




### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| postal_code        | integer   | null: false |
| prefectures        | integer   | null: false |
| city               | string    | null: false |
| building_name      | string    | 
| telephone_number   | integer   | null: false |
| buyer              | references| foreign_key: true | null: false |

＊building_name のみ 空欄可

### Association
- belongs_to :buyer
