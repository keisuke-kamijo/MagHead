FROM ruby:3.0.4

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# ワーキングディレクトリの作成
RUN mkdir /myapp
WORKDIR /myapp

# ホストのGemfileとGemfile.lockをコンテナにコピー
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Bundlerを使ってGemをインストール
RUN bundle install

# ホストのすべてのファイルをコンテナにコピー
COPY . /myapp

# ポート3000を公開
EXPOSE 3000

# コンテナが起動するたびにスクリプトを実行
CMD ["rails", "server", "-b", "0.0.0.0"]