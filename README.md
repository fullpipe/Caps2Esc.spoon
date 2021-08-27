# Caps2Esc.spoon

Map your useless <kbd>caps lock</kbd> to *magic* <kbd>control</kbd>. When you press it with
something else it works like <kbd>control</kbd>. When you press it in isolation it works
as <kbd>escape</kbd>.

## Intallation

You need [Hammerspoon](http://www.hammerspoon.org/) installed.

```bash
brew install hammerspoon
```

Clone spoon

```bash
git clone --depth 1 git@github.com:fullpipe/Caps2Esc.spoon.git ~/.hammerspoon/Spoons/Caps2Esc.spoon
mkdir -p ~/.hammerspoon
echo "hs.loadSpoon('Caps2Esc'):start()" >> ~/.hammerspoon/init.lua
```

Open *System Preferences*, navigate to *Keyboard > Modifier Keys*, set the <kbd>caps lock</kbd> key to <kbd>control</kbd>.

Reload hammerspoon config. That's it.
