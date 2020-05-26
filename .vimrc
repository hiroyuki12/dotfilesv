" nnoremap sf :new<Cr>:FuzzyFinderFile<Cr>

set incsearch   " 検索文字を打ち込むと即検索する（インクリメンタルサーチ）
set ignorecase  " 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set laststatus=2  " need statusline
set statusline=%t\ %y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%r%m%=%c:%l/%L[%3p%%]
syntax on " color    /etc/vimrc(fedora)

imap <C-l> <esc>
map <C-l> <esc>
cmap <C-l> <C-C>
nnoremap ,vr :source %<CR>
map <C-k> D
map <Space> <C-d>
map <C-a> 0
cmap <C-a> <Home>
map <C-e> $
cmap <C-e> <End>
cmap <C-F> <Right>
cmap <C-B> <Left>
cmap <C-D> <Delete>
nnoremap qq :wq<CR>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g* g*zzzv
nnoremap g# g#zzzv

" ssで分割 scで閉じる so
noremap ss <C-W>s
noremap sc <C-W>c
noremap so <C-W>o
"move
"tt で別のウィンドウへ移動 sjで下 siで上
noremap tt <C-W><C-W>
"noremap sj <C-W>j
"noremap si <C-W>k
"resize +広げる -狭める
"noremap + <C-W>+
"noremap - <C-W>-
" zEnter で最大化
"noremap z<CR> <C-W>_
" z0 で最小化
"noremap z0 1<C-W>_
" z. で均等に
"noremap z. <C-W>=

" b でブレース 対応する括弧(){}にジャンプ
nmap b %

" 全角スペースを視覚化
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
"match ZenkakuSpace /　/
"" http://d.hatena.ne.jp/magicalhat/20081223/1230013283
"if has("autocmd")
"  filetype plugin indent on
"  autocmd FileType perl,cgi :compiler perl  "コンパイラの指定
"
"  " テンプレ http://d.hatena.ne.jp/higeorange/20071003/1191356790
"  "autocmd BufNewFile *.html 0r ~/.vim/templates/skel.html
"
"  " filetypeをセット http://d.hatena.ne.jp/rdera/20090110/1231565387
"  " autocmd BufNewFile,BufReadPost ~/.zfunc/* :set ft=zsh
"
"  " カーソルの位置を復元 Ubuntu 8.10
"  " http://d.hatena.ne.jp/chonmagejiro/20080815/1218780398
"  " When editing a file, always jump to the last known cursor position.
"  " Don't do it when the position is invalid or when inside an event handler
"  " (happens when dropping a file on gvim).
"  autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \   exe "normal g`\"" |
"    \ endif
"endif

" 文字コードの自動認識
" http://www.kawaz.jp/pukiwiki/?vim#cb691f26
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif


" comment out

" http://hatena.g.hatena.ne.jp/hatenatech/20060515/1147682761
"set nocompatible  " Use Vim defaults instead of 100% vi compatibility
"set backspace=indent,eol,start  " more powerful backspacing
"set nobackup    " Don't keep a backup file
"set number      " 行番号を表示 :se nu  非表示 :se nonu  :h number
"set wildmenu    " :e .v<TAB><TAB> した時に補完候補を上に表示
"set list      " 改行に$を表示 :se list :se nolist
"set expandtab
"set tabstop=2
"set softtabstop=2
"set shiftwidth=2
"set autoindent
"set cindent
"set smarttab
"set statusline=%n\:\ %f\ %m\ %r%{&foldenable!=0?'[fen]':''}%=%l/%L\ (%p%%)\ %{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
" http://github.com/januswel/dotfiles/blob/68b7980885979acffd2be82a106032e6d2f9c5f4/.vimrc

"set cursorline   " :se cul  :se nocul  :h cursorli
"set hidden " バッファが編集中でもその他のファイルを開けるように
"set fileencoding=utf-8
"set encoding=utf-8
"set showmatch " 対応するカッコを強調表示(   ) 

"colorscheme darkblue " darkblue はデフォルトでインストール済み
"colorscheme desert

" keymap
" http://hatena.g.hatena.ne.jp/hatenatech/20060515/1147682761
" ノーマル、ビジュアル、挿入時、コマンド入力時(:wq)にCtrl + lで抜ける
" L が入力できないので l を入力して~で大文字に変換
" 本来Lは画面の一番下にカーソル移動 一番上はH
"cnoremap <C-l> <C-C>
" :w など入力時にCtrl + l でキャンセル
"inoremap L <ESC>
"inoremap <C-l> <ESC>
"inoremap <C-g> <ESC>
" http://github.com/guyon/configs/tree/master/.vimrc
" .vimrcの再読み込み
"nnoremap ,vr :source $HOME/.vimrc<CR>
" Ctrl + o でジャンプする前の位置に移動(gg,Shift + g,10 Shift + g)
"map <C-z> <C-o>
" Ctrl + k で行末までカット
" Space で半画面スクロール Ctrl + u で上へ半画面スクロール
" 0で行頭。Ctrl + a で行頭 本来Ctrl + a は値の増加
" すべて選択 ggVG
" すべてコピー ggyG
" 行末までコピー y Ctrl + e
" $ で行末。Ctrl + e で行末 本来Ctrl + e は1行下にスクロール 上はCtrl + y
"map <C-e> $
" Shift + c 行末までカットして挿入モード
" command mode 時 tcsh風のキーバインドに
" Ctrl + l で ESC(コマンド入力時(:wqとか))
" ee で上書き保存 eで文字の末尾に移動が遅くなる
"nnoremap ee :w<CR>
" qq で上書き保存して終了 Shift + zz
" :ls でbuffer一覧表示
" :e .emacs で新しくbufferに開く
"buffer operation
"nnoremap sn :bn<CR>
"nnoremap <C-T> :bn<CR>
"nnoremap sp :bp<CR>
"window operation


" 表示行単位で行移動する 長い行で自動折り返した時用
"nnoremap j gj
"nnoremap k gk

" http://d.hatena.ne.jp/guyon/20081230/1230648901
" http://github.com/guyon/configs/tree/master/.vimrc
" 検索時に画面中央にくるようにする
" nzzを割り当てるとfold時の検索でnを押して次に進んだ場合に自動展開されない




" メモ memo
" vimturor
" :help a または :h a。分割ウィンドウで表示。scで閉じる。z.で同じサイズに
" :h ctrl-z。:h insert-index。
"
" アンドゥ u。行全体のアンドゥ shift + u。やり直し Ctrl + r
" 行の切り取り dd
" 行のコピー yy
" 4文字コピー y4
" 行末までカット shift + d
" 画面の一番上に移動  Shift + h  中央 Shift + m  一番下  Shift + l
" ペースト p
" 上書き保存 :w
" ESC = Ctrl + l
" 下スクロール Ctrl + f
" 上スクロール Ctrl + b
" ウィンドウ分割 ss
" ウィンドウを閉じる sc
" http://d.hatena.ne.jp/shakaku/20090124
" vlllとかで選択して "+y でコピーします（Firefoxとかに貼り付け可能)
" .vimrc を編集保存して、:source % するかvimを再起動すると反映します。
" アドレスを右クリックしてFirefoxで開ける
" Shift + k  関数の説明?
" :x (または :wq) 保存して終了
" :w で上書き保存
" $ vimtutor
" d0 行頭までをカット。shift + d 行末までカット。
" カーソルの位置は自動保存
" 10 Shift + g で 10行めにジャンプ
" 10 j 10行下にジャンプ。Ctrl + zで戻る
" Ctrl + z  ジャンプする前の位置に戻る
" http://www.thinkit.co.jp/article/123/3/
" :new または Ctrl + w n 新しいウィンドウを開く
" z<Enter>  分割中のアクティブなウィンドウを最大化
" z0 分割中のアクティブなウィンドウを最小化
" z. 分割ウィンドウを同じ大きさに変更
" z10<Enter>  分割中アクティブなウィンドウを10行表示
" z- カーソル行を一番下になるようスクロール
" zt カーソル行を画面の最初に。zz 中央に。zb 最後に。
" v でビジュアルモード、再度vで抜ける(Shift + v、Ctrl + vも同様)
" gd カーソルのある位置の文字で検索(* と同じ)
" ga アスキーコードを表示
" Ctrl + m  次の行の行頭に移動
" gi 最後に追加した後の位置に追加
" e 文字の末尾に移動(wと同じ？)。ge 前の文字の末尾に移動
" 文字コード指定して開き直す
":e ++enc=euc-jp
":e ++enc=sjis
":e ++enc=iso-2022-jp
" :lcd Desktop  分割したウィンドウだけcd
" 単語の補完 Ctrl + p。Ctrl + n で後方。Ctrl + l で決定。
" /hello 後方検索。?hello 前方検索。n で次を検索。Shift + n で前。
" /hello して Ctrl + h でBackspace
" o でカーソルの下に新しい行を追加。Shift + o でカーソルのある行に追加
" Shift + r  上書き変更
" ファイルの一番上へ gg。  一番下へ Shift + g。10行めへ 10 Shift + g。
" Shift + a 行末に追加
" :noh または :nohlsearch 検索のハイライトを消す
" Ctrl + z で一時停止  コマンドが入力でき、$ fg で元に戻す
" 関数の折りたたみ zf   展開 Space
" mark(tag)一覧表示 :marks
" markをつける ma(aは任意)  markにジャンプ 'a(aは任意) 終了後も保存
" '' 直前の行（マーク）に戻る。ジャンプする前に戻ったり。
" 大文字小文字の変換 ~
" shift + x 前の文字を削除(Backspaceと同じ)、x カーソルのある文字を削除
" 複数行まとめてコメント化 行頭でCtrl + v jjjj Shift + i # Esc
" pathやファイル名などを表示 2 Ctrl + g
" バッファのリストを表示 :ls
" sn 次のバッファ  sp 前のバッファ
" ファイルをバッファに開く :e .vimrc
" 次のendの前まで削除 d/end<return>
" vllで範囲選択してyでコピー、pでカーソルの右にペースト shift + p で左にペースト
" vllで範囲選択してdでカット、pでカーソルの右にペースト shift + p で左にペースト
" vllで選択中oで選択範囲の四隅へ移動
" 行の特定の文字の手前まで削除 例  ) の手前まで削除するには、ct)
" 半画面下にスクロール 上Ctrl + d  上Ctrl + u
" 保存して終了 shift + zz
" アンドゥ u。行全体をアンドゥ Shift + u。
" アンドゥのやり直し Ctrl + r
" 10行めへジャンプ 10 Shift + g
" 選択スタート v(visual)
" 行選択スタート  Shift + v
" 矩形選択スタート Ctrl + v
" 1行上にスクロール Ctrl + y  下 Ctrl + e
" 1画面上にスクロール Ctrl + b  下 Ctrl + f
" sn  次のバッファを表示  sp 前のバッファを表示
" 文字を削除して挿入モード s  行を削除して挿入モード Shift + s
" 行を切り取り挿入モード cc または Shift + s
" 文字をカーソルの右に追加 a  行末に追加 Shift + a
" 文字をカーソルの左に挿入 i  行頭に挿入 Shift + i
" 同じ行の任意の文字にジャンプ fa(aは任意) ta で文字の手前にジャンプ
" 同じ行の任意の文字にジャンプ fa;(;で繰り返し) fa;,(,で逆方向に繰り返し)
" p viのyやddでコピー・カットしたものを貼り付け
" 行を複製 yyp
" xp 2文字の入れ替え(EmacsではCtrl + t)
" 下に空白行を挿入して挿入モード o
" クリップボードの内容貼り付け :a して Ctrl + Shift + v して Ctrl + c
" 行連結 Shift + j (自動的に半角スペースで区切る)
" * カーソルのある位置の単語で検索。逆方向に検索は#。
" cw 単語を切り取って挿入モード
" dw 単語をカット
" macro記録開始 qa(aは任意) 記録終了 q。 実行 @a。2回実行 2@a
" 行末までをカットして挿入モードへ Shift + c
" コントロールコードの入力 Ctrl + Shift + v (例えば :set をコピーした状態で)
" indent追加  shift + > + >、  indent解除  shift + < + <。 複数行選択しても可能
" Shift + v で行を選択して、> でindent追加。 >.. で連続
" Shift + q  Exモード
" 保存 :w。保存して終了 :wq。保存せず終了 :q!。

"filetype plugin indent on
