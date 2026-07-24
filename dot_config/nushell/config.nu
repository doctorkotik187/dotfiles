# -- PATH ---------------------------------------------------

$env.PATH ++= [
  "/var/home/linuxbrew/.linuxbrew/bin"
  "/var/home/linuxbrew/.linuxbrew/sbin"
  "~/.config/emacs/bin"
]

# -- ACTIVATE PROGRAMS --------------------------------------

const AUTOLOAD_DIR = ($nu.data-dir | path join "vendor/autoload")
mkdir $AUTOLOAD_DIR
^mise activate nu | save -f ($AUTOLOAD_DIR | path join "mise.nu")
^starship init nu | save -f ($AUTOLOAD_DIR | path join "starship.nu")
^zoxide init nushell | save -f ($AUTOLOAD_DIR | path join "zoxide.nu")
^carapace _carapace nushell | save -f ($AUTOLOAD_DIR | path join "carapace.nu")

# -- VARIABLES -----------------------------------------------

$env.XDG_CONFIG_HOME = ($env.HOME | path join ".config")
$env.DO_NOT_TRACK = 1                                           # respected by crush.ai and others
$env.config.show_banner = false
$env.EDITOR = "emacs -nw"

# -- AI (secret-tool store) ---------------------------------
# API keys stored in gnome-keyring via secret-tool
# usage: secret-tool store --label="AI <Service> API Key" service <service> username api-key

$env.GEMINI_API_KEY = (secret-tool lookup service gemini username api-key)
$env.OPENROUTER_API_KEY = (secret-tool lookup service openrouter username api-key)
$env.GROQ_API_KEY = (secret-tool lookup service groq username api-key)

# -- ALIASES ------------------------------------------------

alias "e"      = emacs -nw                                      # launch emacs in terminal
alias "brewbg" = brew bundle --global --verbose                 # use global brew bundle file ~/.Brewfile
alias "justg"  = just --global-justfile                         # use global just file ~/.config/just/justfile
alias "jjst"   = jj status                                      # common jj typo
alias "jj sq"  = jj squash                                      # shortcut

# -- CUSTOM COMMANDS ----------------------------------------
# Only true interactive-shell helpers stay here, rest is in justfile.

# delete emacs cache and nushell history
def clean-cache [] {
    history --clear; print "Nushell history cleared."
    rm -rfv ~/.config/emacs/.local/cache/*; print "Emacs cache deleted."
}

# "disable" previews for yazi (workaround for zellij rendering bug)
def yz [] {
    with-env { TERM: "xterm-kitty" } { ^yazi }
}
