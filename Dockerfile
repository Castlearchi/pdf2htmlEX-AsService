# ビルドステージ
FROM bwits/pdf2htmlex-alpine
FROM golang:1.16 AS build

# ワーキングディレクトリを設定
WORKDIR /usr/local/bin/

# 必要な Go ファイルをコピー
COPY main.go .

# Go アプリケーションをビルド
RUN go build -a -tags netgo -o app main.go

# ビルドステージから実行可能ファイルをコピー
COPY --from=build /src/app /app

# ポートを開放
EXPOSE 8080

# 実行可能ファイルを実行
CMD ["/app"]
