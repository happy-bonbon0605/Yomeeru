# Yomeeru

Dedicate to his wife

## 事前準備

Yomeeruのログイン機能はGithub APIのOauthを利用するため、[こちら](https://github.com/settings/applications)より、Developer applicationsに登録し、Yomeeruのための __Client ID__ と __Client Secret__ を取得してください。

### 設定内容サンプル

`localhost:3000`を環境に応じて変更してください。

* Application name（任意）
  * Yomeeru
* Homepage URL
  * http://localhost:3000
* Description
  * happy wedding for ogasawara-san
* Authorization callback URL
  * http://localhost:3000/auth/github/callback

## 環境構築

```sh
git clone git@github.com:happy-bonbon0605/Yomeeru.git
cd Yomeeru

bundle install --path vendor/bundle

bundle exec rake db:create
bundle exec rake db:migrate

cp config/application.yml.sample config/application.yml # 必要に応じて環境変数をセット

bundle exec rails runner lib/batch/insert_to_members_from_github_contributors.rb

# ex) bash,zsh
export GITHUB_KEY="XXXXXXXXX"         # Yomeeru用のClient IDを設定
export GITHUB_SECRET="XXXXXXXXXXXXX" # Yomeeru用のClient Secretを設定
# 暫定対応で、投票可能な人のUIDを設定してください
export GITHUB_UID="XXXXXXXXX"

# 必要に応じて、Settingslogic で設定している uid を自分のものに変える（次項参照）

bundle exec rails server
```

# 補足

## 投票機能を利用したい場合

以下でログイン後の画面遷移制御を`sessions_controller.rb`でおこなっています。

```rb
if user.uid == Settings.bonbon_uid
  redirect_to votes_select_path
else
  redirect_to votes_path
end
```

uidはGitHubから取得できる値です。自分のuidを `config/application.yml` に設定することで、投票画面に移動できます。

```yml
defaults: &defaults
  # 小笠原さんの uid は '2714316' ですが、これを自分の uid に書き換えることで、投票画面に移動できるようになります。
　# たとえば yucao24hours の uid は '1979779' なので、以下のようにします。
  bonbon_uid: '1979779'
```
