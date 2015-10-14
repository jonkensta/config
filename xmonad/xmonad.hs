import XMonad

import qualified Data.Map as M
import Graphics.X11.Xlib
import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Actions.PhysicalScreens

import System.IO

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig 
         { terminal = "st"
         , startupHook = setWMName "LG3D"
         , keys = myKeys <+> keys defaultConfig
         }
         `additionalKeysP`
         [ ("M-x", spawn "xscreensaver-command -lock")
         ]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
         -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
         -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
         --
         [((modm .|. mask, key), f sc)
             | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
             , (f, mask) <- [(viewScreen, 0), (sendToScreen, shiftMask)]]
