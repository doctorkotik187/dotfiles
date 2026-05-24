;;; init.el -*- lexical-binding: t; -*-

(doom! :input
       ;;bidi              ; (tfel ot) thgir etirw uoy gnipleh
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       (corfu +dabbrev +orderless +icons) ; complete with cap(f), cape and a flying feather!
       (vertico +icons)                   ; the search engine of the future

       :ui
       doom                ; what makes DOOM look the way it does
       ;;dashboard         ; a nifty splash screen for Emacs
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       modeline            ; snazzy, Atom-inspired modeline, plus API
       nav-flash           ; blink cursor line after big motions
       ophints             ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       treemacs            ; a project drawer, like neotree but cooler
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       ;;unicode           ; extended unicode support for various languages
       ;;workspaces        ; tab emulation, persistence & separate workspaces
       ;;zen               ; distraction-free coding or writing

       :editor
       parinfer                         ; edit lisp like it's python
       file-templates                   ; auto-snippets for empty files
       fold                             ; (nigh) universal code folding
       (format +onsave +lsp)            ; automated prettiness
       multiple-cursors                 ; editing in many places at once
       ;;rotate-text                    ; cycle region at point between text candidates
       snippets                         ; my elves. They type so I don't have to
       (whitespace +guess +trim)        ; a butler for your whitespace
       word-wrap                        ; soft wrapping with language-aware indent

       :emacs
       (dired +dirvish +icons) ; making dired pretty [functional]
       electric                ; smarter, keyword-based electric-indent
       ;;eww                   ; the internet is gross
       (ibuffer +icons)        ; interactive buffer management
       ;;tramp                 ; remote files at your arthritic fingertips
       undo                    ; persistent, smarter undo for your inevitable mistakes
       vc                      ; version-control and Emacs, sitting in a tree

       :term
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       ;;vterm             ; the best terminal emulation in Emacs

       :checkers
       (syntax +icons)     ; tasing you for every semicolon you forget
       ;;(spell +flyspell) ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;ansible
       ;;debugger          ; stepping through code, to help you add bugs
       ;;direnv
       docker
       editorconfig           ; let someone else argue about tabs vs spaces
       ;;ein                  ; tame Jupyter notebooks with emacs
       (eval +overlay)        ; run code, run (also, repls)
       lookup                 ; navigate your code and its documentation
       (lsp +eglot +booster)  ; M-x vscode
       ;;terraform            ; infrastructure as code
       tree-sitter            ; syntax and parsing, sitting in a tree...

       :os
       ;;(:if (featurep :system 'macos) macos)  ; improve compatibility with macOS
       tty                                      ; improve the terminal Emacs experience

       :lang
       ;;ada               ; In strong typing we (blindly) trust
       ;;(agda +local)     ; types of types of types of types...
       ;;beancount         ; mind the GAAP
       ;;(cc +lsp)         ; C > C++ == 1
       (clojure +lsp +tree-sitter) ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       ;;data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;dhall
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp          ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       ;;fortran           ; in FORTRAN, GOD is REAL (unless declared INTEGER)
       ;;fsharp            ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       ;;(go +lsp)         ; the hipster dialect
       ;;(graphql +lsp)    ; Give queries a REST
       ;;(haskell +lsp)    ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       json                ; At least it ain't XML
       ;;janet             ; Fun fact: Janet is me!
       ;;(java +lsp)       ; the poster child for carpal tunnel syndrome
       javascript          ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean              ; for folks with too much to prove
       ledger              ; be audit you can be
       lua                 ; one-based indices? one-based indices
       markdown            ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       ;;odin              ; C, minus its footguns
       org                 ; organize your plain life in plain text
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;graphviz          ; diagrams for confusing yourself even more
       ;;purescript        ; javascript, but functional
       (python +lsp +tree-sitter) ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ruby                ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       (rust +lsp)         ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;(scheme +guile)   ; a fully conniving family of lisps
       sh                  ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       web                 ; the tubes
       yaml                ; JSON, but readable
       ;;zig               ; C, but simpler

       :email
       ;;(mu4e +org +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       ;;emms
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader

       :config
       (default +bindings +smartparens))
