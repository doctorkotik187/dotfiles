$env.config.show_banner = false

# PATH
$env.PATH ++= [
  '/var/home/linuxbrew/.linuxbrew/bin'
  '/var/home/linuxbrew/.linuxbrew/sbin'
]

# mise
mkdir ($nu.data-dir | path join "vendor/autoload")
^mise activate nu | save -f ($nu.data-dir | path join "vendor/autoload/mise.nu")

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# helix
$env.config.buffer_editor = "hx"
