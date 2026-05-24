$env.config.show_banner = false

# PATH
$env.PATH ++= [
  "/var/home/linuxbrew/.linuxbrew/bin"
  "/var/home/linuxbrew/.linuxbrew/sbin"
  "~/.local/share/mise/shims"
  "~/.config/emacs/bin"
]

# ACTIVATE PROGRAMS
const AUTOLOAD_DIR = ($nu.data-dir | path join "vendor/autoload")
mkdir $AUTOLOAD_DIR
^mise activate nu | save -f ($AUTOLOAD_DIR | path join "mise.nu")
^starship init nu | save -f ($AUTOLOAD_DIR | path join "starship.nu")
^zoxide init nushell | save -f ($AUTOLOAD_DIR | path join "zoxide.nu")
^carapace _carapace nushell | save -f ($AUTOLOAD_DIR | path join "carapace.nu")

# CONFIG PROGRAMS
$env.EDITOR = "emacs -nw"
alias e = emacs -nw
def yazi [] { with-env { TERM: "xterm-kitty" } { ^yazi } } # "disable" previews for zellij
alias brewb = brew bundle --global # alias for `brew bundle --global` (~/.Brewfile)

# FINANCE
$env.LEDGER_FILE = "~/mount/dk.dec/finance/hledger/2025-2020.journal"

# GIT COMPATIBILITY
git config --global user.name (jj config get user.name)
git config --global user.email (jj config get user.email)
git config --global gpg.format (jj config get signing.backend)
git config --global user.signingkey (jj config get signing.key)
git config --global commit.gpgsign (jj config get git.sign-on-push)

# AI (secret-tool store --label="AI <Service> API Key" service <service> username api-key)
$env.GEMINI_API_KEY = (secret-tool lookup service gemini username api-key)
$env.OPENROUTER_API_KEY = (secret-tool lookup service openrouter username api-key)
$env.GROQ_API_KEY = (secret-tool lookup service groq username api-key)

# OTHER
$env.DO_NOT_TRACK = 1 # for crush.ai but also maybe others

# CUSTOM COMMANDS
# delete emacs cache and nushell history
def clean-cache [] {
    history --clear; print "Nushell history cleared."
    rm -rfv ~/.config/emacs/.local/cache; print "Emacs cache deleted."
}
