set nocompatible

if has("gui_running")
    set guioptions=agimP
endif

let ropevim_enable_shortcuts = 1
let g:pymode_rope_autoimport_generate = 0
let g:pymode_rope_autoimport_underlineds = 0
let g:pymode_rope_codeassist_maxfixes = 10
let g:pymode_rope_sorted_completions = 1
let g:pymode_rope_extended_complete = 1
let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
let g:pymode_rope_confirm_saving = 1
let g:pymode_rope_global_prefix = "<C-x>p"
let g:pymode_rope_local_prefix = "<C-c>r"
let g:pymode_rope_vim_completion = 1
let g:pymode_rope_guess_project = 0
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_always_show_complete_menu = 0

set formatoptions+=n
