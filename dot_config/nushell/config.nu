# -- CORE SETUP ---------------------------------------------

$env.config.show_banner = false   # disable nushell startup banner

# -- PATH ---------------------------------------------------

$env.PATH ++= [
  "/var/home/linuxbrew/.linuxbrew/bin"
  "/var/home/linuxbrew/.linuxbrew/sbin"
  "~/.local/share/mise/shims"
  "~/.config/emacs/bin"
]

# -- ACTIVATE PROGRAMS --------------------------------------

const AUTOLOAD_DIR = ($nu.data-dir | path join "vendor/autoload")
mkdir $AUTOLOAD_DIR
^mise activate nu | save -f ($AUTOLOAD_DIR | path join "mise.nu")
^starship init nu | save -f ($AUTOLOAD_DIR | path join "starship.nu")
^zoxide init nushell | save -f ($AUTOLOAD_DIR | path join "zoxide.nu")
^carapace _carapace nushell | save -f ($AUTOLOAD_DIR | path join "carapace.nu")

# -- CONFIG -------------------------------------------------

$env.EDITOR = "emacs -nw"
$env.LEDGER_FILE = "~/mount/dk.dec/finance/hledger/2025-2020.journal"

# -- GIT COMPATIBILITY --------------------------------------

git config --global user.name (jj config get user.name)
git config --global user.email (jj config get user.email)
git config --global gpg.format (jj config get signing.backend)
git config --global user.signingkey (jj config get signing.key)
git config --global commit.gpgsign (jj config get git.sign-on-push)

# -- AI (secret-tool store) ---------------------------------
# API keys stored in gnome-keyring via secret-tool
# usage: secret-tool store --label="AI <Service> API Key" service <service> username api-key

$env.GEMINI_API_KEY = (secret-tool lookup service gemini username api-key)
$env.OPENROUTER_API_KEY = (secret-tool lookup service openrouter username api-key)
$env.GROQ_API_KEY = (secret-tool lookup service groq username api-key)

# -- OTHER --------------------------------------------------

$env.DO_NOT_TRACK = 1   # respected by crush.ai and others

# -- ALIASES ------------------------------------------------

alias e     = emacs -nw                               # launch emacs in terminal
alias brewb = brew bundle --global --verbose          # preview brewfile changes

# -- CUSTOM COMMANDS ----------------------------------------

# delete emacs cache and nushell history
def clean-cache [] {
    history --clear; print "Nushell history cleared."
    rm -rfv ~/.config/emacs/.local/cache/*; print "Emacs cache deleted."
}

# "disable" previews for yazi (workaround for zellij rendering bug)
def yz [] {
    with-env { TERM: "xterm-kitty" } { ^yazi }
}

# brew bundle install + cleanup in one command
def brewb-sync [] {
    print "=== INSTALL ==="
    brew bundle --global --verbose install
    print "=== CLEANUP ==="
    brew bundle --global --verbose cleanup --force
    brew autoremove; brew cleanup
}

# mise install + prune (remove unused tools) in one command
def mise-sync [] {
    print "=== INSTALL ==="
    mise install
    print "=== CLEANUP ==="
    mise prune --yes
}
