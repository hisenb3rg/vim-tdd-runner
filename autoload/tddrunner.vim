if !exists("g:tddrunner#filter")
  let g:tddrunner#filter = ""
endif

function! tddrunner#RunTest(command)
  let l:file = exists("g:tddrunner#file") ? g:tddrunner#file : @%
  let l:generatedCommand = ApplyTestFile(a:command, file)
  let l:generatedCommand = ApplyTestFilter(l:generatedCommand, g:tddrunner#filter)
  execute "!" . l:generatedCommand
endfunction

function! ApplyTestFile(command, file)
  return substitute(a:command, "{file}", a:file, "g")
endfunction

function! ApplyTestFilter(command, filter)
  if len(a:filter) > 0
    let l:commandWithoutParenthesis = substitute(a:command, "(\\(.*{filter}.*\\))", "\\1", "g")
    return substitute(l:commandWithoutParenthesis, "{filter}", a:filter, "g")
  else
    return substitute(a:command, "(.*{filter}.*)", "", "g")
  endif
endfunction

function! tddrunner#SetTestFile()
  let g:tddrunner#file = @%
  echo "Test file: " . g:tddrunner#file
endfunction

function! tddrunner#SetTestFilter()
  call inputsave()
  let g:tddrunner#filter = input("Test filter regex: ", g:tddrunner#filter)
  call inputrestore()
endfunction
