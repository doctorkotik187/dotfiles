$env.config.show_banner = false

# PATH
$env.PATH ++= [
  "/var/home/linuxbrew/.linuxbrew/bin"
  "/var/home/linuxbrew/.linuxbrew/sbin"
  "~/.local/share/mise/shims"
  "~/.config/emacs/bin"
]

# activate programs
const AUTOLOAD_DIR = ($nu.data-dir | path join "vendor/autoload")
mkdir $AUTOLOAD_DIR
^mise activate nu | save -f ($AUTOLOAD_DIR | path join "mise.nu")
^starship init nu | save -f ($AUTOLOAD_DIR | path join "starship.nu")
^zoxide init nushell | save -f ($AUTOLOAD_DIR | path join "zoxide.nu")
^carapace _carapace nushell | save -f ($AUTOLOAD_DIR | path join "carapace.nu")

# config programs
$env.EDITOR = "emacs -nw"
alias e = emacs -nw
alias hx = /var/home/linuxbrew/.linuxbrew/bin/hx
def yazi [] { with-env { TERM: "xterm-kitty" } { ^yazi } } # "disable" previews in zellij
alias brewb = brew bundle --global # alias for `brew bundle --global` (~/.Brewfile)

# finance
$env.LEDGER_FILE = "~/mount/dk.dec/finance/hledger/2025-2020.journal"

# git compatibility
git config --global user.name (jj config get user.name)
git config --global user.email (jj config get user.email)
git config --global gpg.format (jj config get signing.backend)
git config --global user.signingkey (jj config get signing.key)
git config --global commit.gpgsign (jj config get git.sign-on-push)

# ai (secret-tool store --label="AI <Service> API Key" service <service> username api-key)
$env.GEMINI_API_KEY = (secret-tool lookup service gemini username api-key)
$env.OPENROUTER_API_KEY = (secret-tool lookup service openrouter username api-key)

# other
$env.DO_NOT_TRACK = 1 # for crush.ai but also maybe others
