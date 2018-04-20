let g:mapleader = ","
let g:maplocalleader = "\\"

" Commands>
command!  Wq    wq
command!  WQ    wq
command!  Q     q
command!  W     w

" Plugins
nnoremap  <C-b>                     :CtrlPBuffer<CR>
inoremap  <C-b>                     <C-o>:CtrlPBuffer<CR>
nnoremap  <C-p>                     :CtrlP<CR>
inoremap  <C-p>                     <C-o>:CtrlP<CR>
nnoremap  <SID>                     <Plug>Tex_Help
inoremap  <SID>                     <Plug>Tex_Help
nnoremap  <SID>                     <Plug>IMAP_JumpForward
vnoremap  <SID>                     <Plug>IMAP_JumpForward
noremap   <silent><Leader>nt        :NERDTreeToggle<CR>
vnoremap  <silent><Leader>nt        <ESC>:NERDTreeToggle<CR>
nnoremap  <Leader>syn               :SyntasticToggleMode<CR>
vnoremap  <Leader>syn               <ESC>:SyntasticToggleMode<CR>
nnoremap  <silent><Leader>tag       :TagbarToggle<CR>
vnoremap  <silent><Leader>tag       <ESC>:TagbarToggle<CR>
nnoremap  <silent><M-h>             :TmuxNavigateLeft<CR>
nnoremap  <silent><M-j>             :TmuxNavigateDown<CR>
nnoremap  <silent><M-k>             :TmuxNavigateUp<CR>
nnoremap  <silent><M-l>             :TmuxNavigateRight<CR>
nnoremap  <silent><M-\>             :TmuxNavigatePrevious<CR>

" Disabled
nnoremap  <F1>                      <NOP>
inoremap  <F1>                      <NOP>
nnoremap  <C-R>                     <NOP>
noremap   <Left>                    <NOP>
noremap   <Right>                   <NOP>
noremap   <Up>                      <NOP>
noremap   <Down>                    <NOP>
noremap   ^                         <NOP>
noremap   $                         <NOP>

" Other
noremap   <silent><Leader><CR>      :noh<CR>
nnoremap  U                         :redo<CR>
nnoremap  <Leader>vl                :setlocal cursorline!<CR>
nnoremap  <Leader>vc                :setlocal cursorcolumn!<CR>
nnoremap  <Leader>ve                :setlocal colorcolumn=81<CR>
nnoremap  <Leader>vn                :setlocal colorcolumn=0<CR>
nnoremap  <Leader>tcs               :call ToggleColorscheme()<CR>
nnoremap  Y                         y$
nnoremap  j                         gj
nnoremap  k                         gk
nnoremap  <Leader>fmt               gg=G<CR>``
nnoremap  gr                        gd[{V%::s/<C-R>///g<Left><Left>
nnoremap  gR                        gD:%s/<C-R>///g<Left><Left>
nnoremap  th                        :tabfirst<CR>
nnoremap  tj                        :tabnext<CR>
nnoremap  tk                        :tabprev<CR>
nnoremap  tl                        :tablast<CR>
nnoremap  tn                        :tabnew<CR>
nnoremap  tq                        :tabclose<CR>
nnoremap  H                         ^
nnoremap  L                         $
vnoremap  L                         g_
inoremap  <C-a>                     <ESC>I
inoremap  <C-e>                     <ESC>A
cnoremap  <C-a>                     <HOME>
cnoremap  <C-e>                     <END>
noremap   j                         gj
noremap   k                         gk
noremap   gj                        j
noremap   gk                        k
nnoremap  gC                        `.
nnoremap  n                         nzzzv
nnoremap  N                         Nzzzv
nnoremap  g;                        g;zz
nnoremap  g,                        g,zz
nnoremap  <C-o>                     <C-o>zz
nnoremap  <silent><leader>il        :set invlist<CR>
vnoremap  <silent><leader>il        :<C-w>set invlist<CR>
inoremap  <C-s>                     <C-o>:w<CR>
nnoremap  <C-s>                     :w<CR>
vnoremap  <C-s>                     :w<CR>
nnoremap  /                         /\v
vnoremap  /                         /\v
inoremap  jk                        <ESC>
inoremap  jK                        <ESC>
inoremap  Jk                        <ESC>
inoremap  JK                        <ESC>
vnoremap  <                         <gv
vnoremap  >                         >gv
cnoremap  w!                        w !sudo tee % >/dev/null
tnoremap  <ESC>                     <C-\><C-n>
tnoremap  <Leader><ESC>             <ESC>
noremap   <C-c>                     <ESC>:Commentary<CR>
vnoremap  <C-c>                     :Commentary<CR>
