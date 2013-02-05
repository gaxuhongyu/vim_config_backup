  let Tlist_Show_One_File=1
  let Tlist_Exit_OnlyWindow=1

  let g:winManagerWindowLayout='FileExplorer|TagList'
  nmap wm :WMToggle<cr>

" set lines=60 columns=40  
  set nocompatible

  filetype on

  filetype plugin indent on
  
  filetype plugin on

  set nobackup

  set noswapfile

  set history=50

  set enc=utf-8  

  set fenc=utf-8  

  set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  

  syntax enable 
  syntax on  

  set number  

  set showmatch

  set ignorecase  

  set hlsearch

  set incsearch

  set tabstop=4  

  set softtabstop=4

  set autoindent

  set cindent

  set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s>1s,=1s,:1s}

  set cindent shiftwidth=4  

  set autoindent shiftwidth=4  

  set wildmode=list:full

  set wildmenu

  colorscheme darkblue

  set iskeyword+=_,$,@,%,#,-

  set report=0

  set mouse=a

  set selection=exclusive

  set selectmode=mouse,key

  imap <F9> <Esc>:up<cr>  

  let NERDTreeShowBookmarks = 1

  let NERDChristmasTree = 1

  let NERDTreeWinPos = "left"

  map <F8> :NERDTree<CR>  

  map <C-j> <C-W>j

  map <C-k> <C-W>k

  map <C-h> <C-W>h

  map <C-l> <C-W>l

  let mapleader = "\\"

  map <leader>F :FufFile<CR>

  map <leader>f :FufTaggedFile<CR>

  map <leader>g :FufTag<CR>

  map <leader>b :FufBuffer<CR>

  map <silent><F3> :NEXTCOLOR<cr>

  map <silent><F2> :PREVCOLOR<cr>

  let g:rubytest_cmd_spec = "rspec -fd %p"

  set tags=/home/xuyong/date_mpp/mpp-01-16_for_3648/tags

  set runtimepath^=~/.vim/bundle/ctrlp.vim

  set cscopequickfix=s-,c-,d-,i-,t-,e-

  let g:indent_guides_guide_size=1

  set list listchars=tab:\|\ 

  "specify search root dir,this folder must contain file:.hong
  let g:ctrlp_root_markers = ['.hong']

  "----------
  " completion with supertab
  "----------
  " use pop-up menu even there¡¯s only one match
  set completeopt=longest,menuone
  " let supertab to be a bit smartter to determine whether
  " <c-p> or <c-x><c-u> should be used.
  let g:SuperTabRetainCompletionType=2
  let g:SuperTabDefaultCompletionType="<C-X><C-O>"

  "----------
  " easlier grep
  "----------
  map <F6> :execute
  \ " grep -srnw --binary-files=without-match
  \ --exclude-dir=.hong
  \ --exclude=tags --exclude=tags.emacs .
  \ -e " . expand("<cword>") . " " <bar> cwindow<CR>
  set grepprg=grep

  map <F4> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*=============================================================================")
    call append(1,"#")
    call append(2,"# Author: Jason(XuYong)")
    call append(3,"#")
    call append(4,"# E-Mail: yong.xu@tieto.com")
    call append(5,"#")
    call append(6,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"#")
    call append(8,"# Filename: ".expand("%:t"))
    call append(9,"#")
    call append(10,"# Description: This file is test")
    call append(11,"#")
    call append(12,"# Version:")
    call append(13,"#")
    call append(14,"# Change history:")
    call append(15,"#")
    call append(16,"# Modifier:")
    call append(17,"#")
    call append(18,"# Change reason:")
    call append(19,"#")
    call append(20,"# Change time:")
    call append(21,"=============================================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
map <F11> :call SetColorColumn()<CR>
function SetColorColumn()
	let col_num = virtcol(".")
	let cc_list = split(&cc, ',')
	if count(cc_list, string(col_num)) <= 0
		execute "set cc+=".col_num
	else
		execute "set cc-=".col_num
	endif
endfunction
map <F10> :call find()<cr>'s
""function find()
""	let
""	find ./ -type f -name "*.rb" | xargs grep -n ("<cword>")
""endfunction
