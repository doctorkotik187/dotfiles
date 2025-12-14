$env.config.show_banner = false

# PATH
$env.PATH ++= [
  '/var/home/linuxbrew/.linuxbrew/bin'
  '/var/home/linuxbrew/.linuxbrew/sbin'
]

# activate programs
mkdir ($nu.data-dir | path join "vendor/autoload")
^mise activate nu | save -f ($nu.data-dir | path join "vendor/autoload/mise.nu")
^starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
^zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

# helix
$env.config.buffer_editor = "hx"

# hledger
$env.LEDGER_FILE = "~/mount/dk.dec/finance/hledger/2025-2020.journal"
