# tddrunner.vim

This is a lightweight test runner for Vim. It doesn't try to smart guess what
you want to run. It simply runs what you tell it to.

It was evolved through TDD practice in Ruby, but is framework- and language-agnostic.

It has three main features. It allows you:

1. To mark a test file and run it from any window inside vim.

2. To apply a filter to run specific test examples of the test file.

   This not only helps you focus on the output of selected test(s), but it can
   also save time while running it.

3. To run a test file through different commands.

   Some tests are fast and you wish to run them as independently,
   others are slower (integration tests) and you wish to run them through a
   test server. Tdd-runner allows you set multiple key bindings
   for each method and also knows how to apply the filter to them.


## Configuration

Add your preferred key mappings to your `.vimrc` file and set the commands for
running the tests. The following config sets the mappings for rspec:

```vim
" Two mappings to run tests independently or via test server:
nmap <leader>t :call tddrunner#RunTest("rspec {file} (-e {filter})")<CR
nmap <leader>r :call tddrunner#RunTest("rspec --drb {file} (-e {filter})")<CR

" Key for marking currently open file for test
nmap <leader>m :call tddrunner#SetTestFile()<CR>

" Key for applying or removing regex filter to your tests.
nmap <leader>f :call tddrunner#SetTestFilter()<CR>
```

Another example for setting two commands for test unit and testdrb:

```vim
nmap <leader>t :call tddrunner#RunTest("ruby -Itest {file} (-n /{filter}/)")<CR
nmap <leader>r :call tddrunner#RunTest("testdrb -Itest {file} (-n /{filter}/)")<CR
```

The command string for running tests has a very simple structure and you should
be able to customize it to your test framework of choice.
