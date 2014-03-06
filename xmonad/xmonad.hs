import XMonad
import XMonad.Hooks.DynamicLog

main = xmonad =<< xmobar defaultConfig
     { terminal ="urxvt -e /bin/zsh"
     , modMask = mod4Mask
     }
