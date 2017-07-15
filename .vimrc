set encoding=utf-8
set ffs=unix,dos,mac
set ambiwidth=double
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard=unnamed,autoselect
set cursorline
set display=lastline
set expandta
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set mouse=a
set nrformats-=octal
set number
set pumheight=10
set ruler
set shiftwidth=2
set showcmd
set smartcase
set smartindent
set smarttab
set statusline+=%r
set statusline+=%<%F
set statusline+=%m
set title
set tabstop=2
set visualbell
set virtualedit=block
set whichwrap=b,s,[,],<,>
set wildmode=list:longest,full
set wrapscan

set t_Co=256
colorscheme railscasts
syntax on
filetype plugin on
filetype indent on

augroup WordCount
    autocmd!
    autocmd BufWinEnter,InsertLeave,CursorHold * call WordCount('char')
augroup END
let s:WordCountStr = ''
let s:WordCountDict = {'word': 2, 'char': 3, 'byte': 4}
function! WordCount(...)
    if a:0 == 0
        return s:WordCountStr
    endif
    let cidx = 3
    silent! let cidx = s:WordCountDict[a:1]
    let s:WordCountStr = ''
    let s:saved_status = v:statusmsg
    exec "silent normal! g\<c-g>"
    if v:statusmsg !~ '^--'
        let str = ''
        silent! let str = split(v:statusmsg, ';')[cidx]
        let cur = str2nr(matchstr(str, '\d\+'))
        let end = str2nr(matchstr(str, '\d\+\s*$'))
        if a:1 == 'char'
            " ここで(改行コード数*改行コードサイズ)を'g<C-g>'の文字数から引く
            let cr = &ff == 'dos' ? 2 : 1
            let cur -= cr * (line('.') - 1)
            let end -= cr * line('$')
        endif
        let s:WordCountStr = printf('%d/%d', cur, end)
    endif
    let v:statusmsg = s:saved_status
    return s:WordCountStr
endfunction

inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap < <><LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

inoremap { {}<LEFT>

autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yml  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sh   setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType zsh  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType js   setlocal shiftwidth=2 tabstop=2 softtabstop=2

