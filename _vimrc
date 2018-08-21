 if has('vim_starting')
   if &compatible
     set nocompatible               
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 let g:vimfiler_as_default_explorer=1
set noundofile

 " NeoBundle 設定
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: neobundle の設定を.gvimrcに書かないこと！

 " ここに追加したいプラグインを追加します。 
NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/neomru.vim'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/vinarise.git'
NeoBundle 'fatih/vim-go'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neoyank.vim'
"NeoBundle 'szw/vim-tags'
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'vim-airline/vim-airline'
"NeoBundle 'vim-airline/vim-airline-themes'
"NeoBundle 'powerline/powerline'
NeoBundle 'easymotion/vim-easymotion'
"NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-pathogen'
"NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'glidenote/memolist.vim'
"NeoBundle 'glidenote/winresizer.vim'
"NeoBundle 'cocopon/vaffle.vim'

"NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'scrooloose/nerdtree'
"NeoBundle 'ryanoasis/vim-devicons'
"NeoBundle 'justinmk/vim-dirvish'

call neobundle#end()


 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


" let g:neocomplete#enable_at_startup = 1
" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif
"let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*'
"

" vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags `pwd` 2>/dev/null &"

" previm
au BufRead,BufNewFile *.md set filetype=markdown

let mapleader = "\<Space>"

" easy-motion
let g:EasyMotion_do_mapping = 0
nmap <Leader>s <Plug>(easymotion-overwin-f2)
vmap <Leader>s <Plug>(easymotion-bd-f2)
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
omap z <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'awsedfghjkl;'
"let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
hi EasyMotionTarget guifg=#80a0ff ctermfg=81
" <Leader>f{char} to move to {char}


" neocomplete
if neobundle#is_installed('neocomplete.vim')
    " Vim起動時にneocompleteを有効にする
    let g:neocomplete#enable_at_startup = 1
    " smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
    let g:neocomplete#enable_smart_case = 1
    " 3文字以上の単語に対して補完を有効にする
    let g:neocomplete#min_keyword_length = 3
    " 区切り文字まで補完する
    let g:neocomplete#enable_auto_delimiter = 1
    " 1文字目の入力から補完のポップアップを表示
    let g:neocomplete#auto_completion_start_length = 2
    " バックスペースで補完のポップアップを閉じる
    inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"

    " エンターキーで補完候補の確定. スニペットの展開もエンターキーで確定・・・・・・②
    imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
    " タブキーで補完候補の選択. スニペット内のジャンプもタブキーでジャンプ・・・・・・③
    imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
endif

"" syntastic
"" 構文エラー行に「>>」を表示
"let g:syntastic_enable_signs = 1
"" 他のVimプラグインと競合するのを防ぐ
"let g:syntastic_always_populate_loc_list = 1
"" 構文エラーリストを非表示
"let g:syntastic_auto_loc_list = 0
"" ファイルを開いた時に構文エラーチェックを実行する
"let g:syntastic_check_on_open = 1
"" 「:wq」で終了する時も構文エラーチェックする
"let g:syntastic_check_on_wq = 1
"
"" Javascript用. 構文エラーチェックにESLintを使用
"let g:syntastic_javascript_checkers=['eslint']
"" Javascript以外は構文エラーチェックをしない
"let g:syntastic_mode_map = { 'mode': 'passive',
"                           \ 'active_filetypes': ['javascript'],
"                           \ 'passive_filetypes': [] }
let g:lightline = {
      \ 'colorscheme': 'iceberg',
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename',
      \ },
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['gitbranch', 'readonly', 'filename', 'modified']]
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:unite_source_history_yank_enable =1  "history/yankの有効化
let g:vimshell_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
set modifiable

" memolist
let g:memolist_path = "C:\\work\\memo\\"
let g:memolist_memo_suffix = "md"
let g:memolist_memo_date = "%Y%m%d %H:%M"
nnoremap <Leader>mn :MemoNew<CR>
nnoremap <Leader>ml :MemoList<CR>
nnoremap <Leader>mg :MemoGrep<CR>

" qfix
set runtimepath+=C:\\tool\\qfixgrep-master\\qfixgrep-master
let QFixWin_EnableMode = 1
let QFix_UseLocationList = 1

command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>
nnoremap <Leader>w :w<CR>


