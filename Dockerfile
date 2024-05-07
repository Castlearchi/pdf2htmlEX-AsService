# ビルドステージ
FROM golang:1.16 AS build

# ワーキングディレクトリを設定
WORKDIR /src

# 必要な Go ファイルをコピー
COPY *.go .

# Go アプリケーションをビルド
RUN go build -a -tags netgo -o app *.go

# 実行ステージ
FROM bwits/pdf2htmlex-alpine

# ビルドステージから実行可能ファイルをコピー
COPY --from=build /src/app /usr/local/bin/app

# ポートを開放
EXPOSE 8080

# 実行可能ファイルを実行
CMD ["/usr/local/bin/app"]
