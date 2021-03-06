# アプリケーション名
AISYO

# アプリケーション概要
格闘ゲームをする人に向けた相性表の作成アプリ。<br>
ユーザーがフォームに入力した値をグラフ化することができる。<br>
また全てのユーザーの結果を平均したグラフを見ることもできる。

# URL
https://aisyo-29219.herokuapp.com/

# テスト用アカウント
## アカウント1
メールアドレス<br>
aaa@gmail.com<br>
パスワード<br>
Zaq12wsx

## アカウント2
メールアドレス<br>
bbb@gmail.com<br>
パスワード<br>
Zaq12wsx

# 利用方法
- ログイン方法は新規登録、もしくはツイッターアカウントがある場合は右上のアイコンからログインできる。<br>
- ログイン、非ログインに関わらず「平均値を見る」のプルダウンボタンでキャラごとの投稿された相性表の平均値を見ることができる。<br>
- ログインしたユーザーは「投稿する」をクリックすると相性表を作成するページに遷移する。<br>
- ログインしたユーザーは「作成したグラフを見る」のプルダウンから自分の作成した各キャラの一番新しい相性表をみることができる。<br>
- 問い合わせのメールを送る場合はフッターの「contact」から問い合わせのメールを送ることができる。

# 目指した課題解決
## 課題 => 解決
- SNSで相性表を投稿したユーザーが叩かれてしまうことがある。もしくは叩かれることを嫌がって投稿できない人がいる。<br>=> 匿名性を出すことで誰が投稿したかわからないようにする。
- 相性表作成において誰でも投稿しやすく、誰もが納得するものを作れる場がない。<br>=> 匿名による投稿ができ、かつ平均値がグラフとして現れるので多くの人が納得しやすい。

# 洗い出した要件
- ヘッダー
  - 【ボタン】
    - サインイン/ログインページへ遷移できるボタンがある
    - ログイン時は、ログアウトと投稿ができるボタンがある
    - ツイッターアカウントでログインできるボタンが有る
  - 【表示】
    - ログイン時にはツイッターでのログインボタンだったところがユーザー名に変わる

  - トップページ
    - 【ボタン】
      - 作成したグラフを見るページに遷移できるプルダウンがある
      - 平均値を見るページに遷移できるプルダウンがある

- 新規登録ページ
  - 【ボタン・フォーム】
    - ニックネーム、メールアドレス、パスワード、パスワードの確認用のフォームがある
    - アカウント作成のボタンがある
  - 【表示】
    - フォームに情報が足りないとアカウント作成できずエラーメッセージが表示される

- ログインページ
  - 【ボタン・フォーム】
    - メールアドレス、パスワードのフォームがある
    - アカウント作成のボタンがある
    - ツイッターアカウントでログインできるボタンがある
  - 【表示】
    - フォームに情報が足りないとアカウント作成できずエラーメッセージが表示される

- 投稿ページ
  - 【ボタン】
    - 使用キャラを選択するプルダウンがある。
    - 剣士、魔法使い、僧侶、格闘家、銃使いに対する相性を決めるためのプルダウンがある
    - 作成した相性表を投稿するボタンがある
  - 【表示】
    - プルダウンに選択されていないものがあるとエラーメッセージが表示される

- 投稿完了ページ
  - 【ボタン】
    - トップページに戻るボタンがある
  - 【表示】
    - 投稿された情報を元にしたグラフが表示される

- 作成したグラフを見るページ
  - 【表示】
    - 作成されたキャラごとのグラフで一番新しいものを元にしたグラフを表示する

- 平均値を見るページ
  - 【表示】
    - キャラごとの投稿を元にして平均値を出したグラフを表示する

# 実装した機能についてのGIFと説明
- ツイッターアカウントでログインができるようにした。<br>
GIF<br>
https://i.gyazo.com/cb2993043ee7b718d54d543ab81957e5.mp4<br>

- 相性表の内容がユーザーごとで統一されるように+2から-2で値を固定した。<br>
GIF<br>
https://i.gyazo.com/a254062f4c597e9928bb3423d64ce1a1.mp4<br>

- 投稿された情報を可視化しやすくするためグラフにして表示できるようにした。<br>
GIF<br>
https://i.gyazo.com/8611844b4352f7f65f4d7a370441dc83.mp4<br>

- 全てのユーザーの情報を元に平均値を出したグラフを表示できるようにした。<br>
GIF<br>
https://i.gyazo.com/1b46d885478212f949f29c31c9bfc05c.mp4<br>

- お問合わせページからフォームを送信すると設定したメールアドレスに問い合わせメールが届くようにした。<br>
GIF<br>
https://i.gyazo.com/3df1f555bbe6095897d5dec631a20c7d.mp4<br>
画像URL<br>
https://i.gyazo.com/211dcd2b34a3fd283e78e1178b7a0fd3.png

# 実装予定の機能
- ログイン時にメールアドレスを忘れた場合に再発行、またはパスワードを記入したメールを送信する機能の実装。
- googleアカウントによるログイン機能の実装。
- ユーザーインターフェイスの改良

# データベース設計
## ER図
画像URL<br>
https://i.gyazo.com/fea297d4a76349602075ee3eb23981f3.png

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

## contacts テーブル
| Column           | Type        | Options                           |
| ---------------  | ----------- | --------------------------------- |
| e_mail           | string      |                                   |
| message          | text        |                                   |


# ローカルでの動作方法
## git cloneからの起動方法

1. % git clone https://github.com/bre0711/aisyo

1. ~ aisyoのディレクトリから rails s

## 開発言語
- Rudy/Ruby on Rails/Javascript/Html/Css/RSpec

## 開発環境
- Ruby/Ruby on Rails/MySQL/Github/heroku/Visual Studio Code

## バージョン

- rails 6.0.0
- ruby  2.6.5
- mysql 5.6.47