# b4_research
research for graduation thesis

## system calls
### bufwrite
bufwrite.c を実行する
bufwrite.c の実行間はログがバッファに自動的に記録される

### bufread
bufwrite system call で記録されたログを print する

## discussion
### CPU-intensive なタスクについて
- プロセスの個数が 1 〜 2 のときは, CPU 2, 3 が特に使われていない
- プロセス数 4 のとき, CPU が一切入れ替わることなかった (why?)
- プロセス数 5 以上の時は動作に致命的な問題点は見られなかった

## progress
### 7/27
- 最終的な出力イメージ(log_goal.txt)を作成
- xv6 をマルチコアに対応
		+ Makefile の QEMUOPTS に sockets=$(CPUS),cores=1,threads=1 を追加

### 7/28
- bufread システムコール追加の練習として, "Hello, World!" を出力する hello コマンドを追加
		+ 同じコマンドだけど, ls はユーザプログラムで, open はシステムコールといった違いがある(?)
- bufwrite/read システムコールの原型を作成
		+ bufwrite : proc.h の buf 変数の値を変更する
		+ bufread  : proc.h の buf 変数の値を print する

### 8/2
- clock の出力を追加
		+ rdtsc は返り値uint64_t でそのまま使えないので, 32 bit ずつ分ける
		+ 32 bit ずつを10進数のフォーマットで print してしまうと値が狂うので, 16進数に変換して print する
		+ 出力を見る感じ, クロックの下位 5bit が0っぽいんだけど, これはあっているのか(?)
- scheduling event の出力を追加

### 8/25
- scheduling event を追加
- cpu_from, cpu_to を cpu のみに
- prev_pstate の出力をサポート

### 9/1
- プロセスの状態が不連続になる不具合を修正
		+ fork() 内の writelog() の表記が原因だった
- ログを読みやすくするための, 文字列置換スクリプトを追加
- 16進数変換のプログラムにおいて, 危ないとの指摘を受けた部分を修正
- クロックの下位 5bit が 0 になる原因を調査
		+ QEMU 外でも似たような挙動を確認した
- bufwrite の処理が軽すぎてログを取りきれない不具合を修正
		+ cprintf() で時間を稼いだが, 本当は sleep(1) のようなものを入れたい

### 9/4
- bufwrite.c 内でのログ記録機能をサポート
		+ ログ記録は1度きりに限定した
- bufwrite.c で forktest() を実行し, グラフを作りながら様子を観察した

### 9/5
- コアの稼働状態をグラフで図示するスクリプトを追加
		+ 線の繋ぎ方に問題が残るものの, 7割程度は完成
- bufwrite コール内で計算に時間を要する CPU-intensive な命令を実行させようとしている

### 9/6
- volatile int の加算によって CPU-intensive な命令を実現
- 計測用スクリプトの様々な不具合を修正
		+ 0 秒時に謎のデータが出現
		+ 線が繋がらない / 意図していない繋がりかたをする
