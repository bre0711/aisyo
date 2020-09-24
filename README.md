# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |

### Association

- has_many  :posts



## posts テーブル

| Column           | Type        | Options                           |
| ---------------  | ----------- | --------------------------------- |
| select_id        | integer     | null: false                       |
| vs_soldier_id    | integer     | null: false                       |
| vs_wizard_id     | integer     | null: false                       |
| vs_monk_id       | integer     | null: false                       |
| vs_fighter_id    | integer     | null: false                       |
| vs_gunner_id     | integer     | null: false                       |
| user             | references  | null: false, foreign_key :true    |

### Association

- belongs_to :user

