augroup VimFiddle
  au BufNewFile fiddle.html call s:FillHtml()
  au BufNewFile fiddle.css call s:PossiblyFillCss()
  au BufNewFile fiddle.js call s:PossiblyFillJs()

  au VimEnter fiddle.html nested call s:PossiblyEditCssJs()
augroup END

let s:jsTemplatePath = expand("<sfile>:h:p") . "/../templates/fiddle.js"
let s:cssTemplatePath = expand("<sfile>:h:p") . "/../templates/fiddle.css"
let s:htmlTemplatePath = expand("<sfile>:h:p") . "/../templates/fiddle.html"
let s:isFiddleSession = 0

function s:EnsureFileTemplate()
  if (!exists("s:html"))
    let s:html = readfile(s:htmlTemplatePath)
    let s:css = readfile(s:cssTemplatePath)
    let s:js = readfile(s:jsTemplatePath)
  endif
endfunction

function s:FillHtml()
  call s:EnsureFileTemplate()
  call append(0, s:html)
  normal dd
endfunction

function s:PossiblyFillCss()
  if (s:isFiddleSession)
    call s:EnsureFileTemplate()
    call append(0, s:css)
    normal dd
  endif
endfunction

function s:PossiblyFillJs()
  if (s:isFiddleSession)
    call s:EnsureFileTemplate()
    call append(0, s:js)
    normal dd
  endif
endfunction

function s:PossiblyEditCssJs()
  let buffers = getbufinfo({'buflisted': 1})
  let windows = len(buffers) == 1 ? buffers[0]['windows'] : 0
  let win = type(windows) == 3 && len(windows) == 1 ? windows[0] : 0

  if (win != 0)
    let s:isFiddleSession = 1
    vs fiddle.js
    execute winbufnr(buffers[0]['bufnr']) . 'wincmd w'
    sp fiddle.css
    sp term://http-server
    clo
    let s:isFiddleSession = 0
  endif
endfunction
