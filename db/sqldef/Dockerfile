# ベースイメージとしてAlpine Linuxを使用
# イメージサイズの最適化のため、baseステージとして定義
FROM alpine AS base

# 必要な証明書とcurlをインストール
# --no-cache: パッケージキャッシュを作成せず、イメージサイズを小さく保つ
RUN apk add --no-cache ca-certificates curl

# sqldefをダウンロードしてインストール
RUN curl -kLSO https://github.com/k0kubun/sqldef/releases/download/v0.17.29/mysqldef_linux_amd64.tar.gz && \
    tar xzf mysqldef_linux_amd64.tar.gz
# UNIXコマンド類をコンテナ内で使用できるように軽量なbusyboxを追加
FROM busybox

# 作業ディレクトリを設定
WORKDIR /sqldef

ADD schema.sql /sqldef/schema.sql
ADD run.sh /sqldef/run.sh
COPY --from=base /mysqldef /usr/bin/mysqldef

# 実行スクリプトに実行権限を付与
RUN chmod +x /sqldef/run.sh

# コンテナ起動時にrun.shを実行
CMD [ "sh", "/sqldef/run.sh" ]
