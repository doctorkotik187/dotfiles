$env.config.show_banner = false

# PATH
$env.PATH ++= [
  "/var/home/linuxbrew/.linuxbrew/bin"
  "/var/home/linuxbrew/.linuxbrew/sbin"
]

# activate programs
const AUTOLOAD_DIR = ($nu.data-dir | path join "vendor/autoload")
mkdir $AUTOLOAD_DIR
^mise activate nu | save -f ($AUTOLOAD_DIR | path join "mise.nu")
^starship init nu | save -f ($AUTOLOAD_DIR | path join "starship.nu")
^zoxide init nushell | save -f ($AUTOLOAD_DIR | path join "zoxide.nu")
^carapace _carapace nushell | save -f ($AUTOLOAD_DIR | path join "carapace.nu")

# config programs
$env.config.buffer_editor = "hx"
$env.LEDGER_FILE = "~/mount/dk.dec/finance/hledger/2025-2020.journal"
def yazi [] { with-env { TERM: "xterm-kitty" } { ^yazi } }  # "disable" previews in zellij
