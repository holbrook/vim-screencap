"  _   _       _ _                     _
" | | | | ___ | | |__  _ __ ___   ___ | | __
" | |_| |/ _ \| | '_ \| '__/ _ \ / _ \| |/ /
" |  _  | (_) | | |_) | | | (_) | (_) |   <
" |_| |_|\___/|_|_.__/|_|  \___/ \___/|_|\_\
" wanghaikuo@gmail.com
"
" vim screen capture plugin



if !has('python')
    echo "Error: Required vim compiled with +python"
    finish
endif

function! ScreenCap()
let cmd_str = "mkdir -p "
let cmd_str.= expand("%:p:h") 
let cmd_str.= "/assets"
" echo cmd_str
let b = system(cmd_str)
let time_str = system("date +%Y-%m-%s")
let f = "assets/"
let f.= expand("%:r")
let f.= "_"
let f.= localtime()
let f.= ".png"

let cmd_str = "screencapture -i "
let cmd_str.= f
echo "截图中..." 
let b = system(cmd_str)

let str = "![]("
let str.= f
let str.= ")"
let c = append(line('.'),str) 

endfunction

" define command
command! -nargs=0 ScreenCap call ScreenCap()
map <F10> :ScreenCap<CR>
imap <F10> <ESC><F10>jji
