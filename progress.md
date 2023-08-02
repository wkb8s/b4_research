# progress

## 7/27
- 最終的な出力イメージ(log_goal.txt)を作成
- xv6 をマルチコアに対応
		+ Makefile の QEMUOPTS に sockets=$(CPUS),cores=1,threads=1 を追加

## 7/28
- bufread システムコール追加の練習として, "Hello, World!" を出力する hello コマンドを追加
		+ 同じコマンドだけど, ls はユーザプログラムで, open はシステムコールといった違いがある(?)
- bufwrite/read システムコールの原型を作成
		+ bufwrite : proc.h の buf 変数の値を変更する
		+ bufread  : proc.h の buf 変数の値を print する

## 8/2
- clock の出力を追加
		+ 出力を見る感じ, クロックの下位 5bit が0っぽいんだけど, これはあっているのか(?)

# goal

## bufread, bufwrite システムコールの追加

### bufwrite
- flag_write_log を true にする
- 変数 buf が満杯になると, flag_write_log を false にする
		+ スケジューラは flag_write_log が true の場合, コアの状態を観測しその情報を変数 buf に書き込み続ける

### bufread
- 変数 buf を読み込み, 出力する


# task
- cpu の1クロックあたりの時間を確認
- uint64_t をなんとか cprintf する方法を探す
