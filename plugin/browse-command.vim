func! s:getCompleteFunc(name, dirPath,reFilter)
    let matchesReFilterCode = "func! MatchesReFilter(idx, val)"."\n"
    let matchesReFilterCode .="    return a:val =~? '".a:reFilter."'"."\n"
    let matchesReFilterCode .="endfunc"
    execute matchesReFilterCode
    let code = 'function! BrowseCommandComplete'.a:name.'(ArgLead, CmdLine, CursorPos)'."\n"
    let code .='    let directories=glob(fnameescape('."'".a:dirPath."'".').'."'".'/{,.}*/'."'".', 1, 1)'."\n"
    let code .='    let dps = map(directories, '."'".'fnamemodify(v:val, ":h:t")'."'".')'."\n"
    let code .='    let dps = filter(dps, funcref("MatchesReFilter"))'."\n"
    let code .='    let result = filter(dps, '."'".'v:val =~? "'."'".'.a:ArgLead.'."'".'.*"'."'".')'."\n"
    let code .='    return result'."\n"
    let code .='endfunction'."\n"
    execute code
    return 'BrowseCommandComplete'.a:name
endfunc

func! s:BrowseCommand(name,dirPath,reFilter,...)
    let l:command = ':edit '.a:dirPath.'/<args>'
    if len(a:000) > 0
        let l:command = join(a:000, ' ')
    endif
    exec('command! -nargs=? -complete=customlist,'.s:getCompleteFunc(a:name,a:dirPath,a:reFilter).' '.a:name.' '.l:command)
endfunc

command! -nargs=+ BrowseCommand :call s:BrowseCommand(<f-args>)
