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

### I/O-intensive なタスクについて
- CPU-intensive なタスクとは異なりI/O を発行しているので, 各コアで常にプロセスが RUNNING で動いていることは起きず, 細切りのグラフ形状になった
- pid 3 は I/O 処理を行わないにも関わらず RUNNING 状態が長く続いていることが読み取れるが, これは fork を自分一人で全て行っているためであると考えられる
- SLEEPING から復帰した際にも, 前と同じコアで処理が継続するケースが多く見られた
+ CPU-intensive の処理の場合にはこのような現象は見られなかったが, なぜ？
+ ↑ そもそも sleep しないから？

### CPU-intensive, I/O-intensive なタスクを同時に実行した際の挙動
- コアを跨ぐことはあるものの, CPU-intensive なタスクは RUNNING が途切れることはな-い
- 一方, I/O-intensive なタスクは細切れで実行された
- 両者が同時に実行されることでスケジューリングに不具合が発生することはなく, 想定通りの挙動となった

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

### 9/7
- file に write() を行う, I/O intensive な命令についてコア状態を測定
+ usertest 用のスクリプトがすでに用意されていたので, それを利用
- 計測用スクリプトの不具合を修正
+ sleep から復帰後に同一コアでプロセスが RUNNING になると, 線の繋がりがおかしくなる

### 9/8
- scheduler gaming の方針を決めるために, xv6 のソースコードをもう一度読み直す
+ scheduler を作り直す可能性あり

### 9/9
- スクリプトの描画において発見した不具合を修正
- xv6 スケジューラを, 優先度付き Round-Robin に改良
+ 改良前と改良後で動作に違いが出るか確かめているが, うまく visualize できていない
+ もしかしたら plot.py にまだ修正すべき点があるかもしれない

### 9/12
- MLFQ-like scheduler が, 概ね想定通りの動作をすることを確認
+ CPU-intensive なプロセスAが動いていたとき, 途中から CPU-intensive なプロセスBが動きはじめると, プロセスA は starvation-like な動きをすることが確認できた
- Priority Boost を実装
+ 上に挙げた MLFQ-like scheduler の症状をほどほど改善できた

### 9/13
- Priority Boost を修正
+ 「time slice を 10 回使い切ったときに Boost」 → 「timer interrupt が 10 回起こった時に Boost」 に変更

### 9/14
- 「ちょびっと計算 → yield」を繰り返すワークロードを作成し, デフォルトでは ptable のグローバルロックによるスケジューラの遅延が発生することを確認
- global lock を最小限にとどめ, 各コアが独立して動くようにランキュー・スケジューラを実装

### 9/15
- 昨日の実装の続き
+ エラー続きで難航

### 9/19
- Multiple runqueue scheduler の原型を実装
+ initproc の時、次 switch するプロセスの選び方がよく分からない
- runqueue の動作を print して可視化
+ マルチコアで動かすと挙動がおかしくなってしまう

### 9/20
- Multiple runqueue scheduler が動作するようにデバッグ
+ switch 後に inode 関連のパニックが生じる(?)
+ initproc に switch できていない可能性 (pid が不一致)
- QEMU のアクセラレータとして, KVM を用いるように Make のオプションを変更
+ Clock の下位 5 bit が 0 になる問題は解消された
+ しかし, 実行時間（経過clock）が 30 倍程度長くなった
