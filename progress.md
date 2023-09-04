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
		+ rdtsc は返り値uint64_t でそのまま使えないので, 32 bit ずつ分ける
		+ 32 bit ずつを10進数のフォーマットで print してしまうと値が狂うので, 16進数に変換して print する
		+ 出力を見る感じ, クロックの下位 5bit が0っぽいんだけど, これはあっているのか(?)
- scheduling event の出力を追加

## 8/25
- scheduling event を追加
- cpu_from, cpu_to を cpu のみに
- prev_pstate の出力をサポート

## 9/1
- プロセスの状態が不連続になる不具合を修正
		+ fork() 内の writelog() の表記が原因だった
- ログを読みやすくするための, 文字列置換スクリプトを追加
- 16進数変換のプログラムにおいて, 危ないとの指摘を受けた部分を修正
- クロックの下位 5bit が 0 になる原因を調査
		+ QEMU 外でも似たような挙動を確認した
- bufwrite の処理が軽すぎてログを取りきれない不具合を修正
		+ cprintf() で時間を稼いだが, 本当は sleep(1) のようなものを入れたい

# goal

## bufread, bufwrite システムコールの追加

### bufwrite
- flag_write_log を true にする
- 変数 buf が満杯になると, flag_write_log を false にする

### bufread
- 変数 buf を読み込み, 出力する


# task
