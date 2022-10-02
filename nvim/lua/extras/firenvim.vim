if exists('g:started_by_firenvim')
    " no statusbar
    set laststatus=0
    " disabling firenvim for some websites...
    let fc = g:firenvim_config['localSettings']
    let fc['https://web.whatsapp.com'] = { 'takeover': 'never', 'priority': 1 }

    " syntax recognization for different websites
    au BufEnter github.com_*.txt set filetype=markdown
else
    " only show when the session is not in browser...
    set laststatus=2
endif