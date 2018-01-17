import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import Data.List        -- provides isPrefixOf isSuffixOf and isInfixOf
import qualified XMonad.StackSet as W

-- 'zip' will only bind as many keys as there are workspaces so define some more
myWorkspaces = map show [1..12]

myManageHook = composeAll
   [ className =? "mpv"  --> doFloat    -- set the default layout of mpv window in float mode
   , className =? "libreoffice-calc"  --> doFloat       -- fail
   , manageDocks
   ]

main = do
    xmproc <- spawnPipe "xmobar"

    xmonad $ defaultConfig
        { workspaces = myWorkspaces
        , manageHook = myManageHook <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#009688" "" . shorten 100
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask, xK_Pause), spawn "~/.xmonad/dmenu-session-end.sh")
        , ((0, xK_Print), spawn "xfce4-screenshooter")
        , ((mod4Mask, xK_Home), spawn "pcmanfm")
        , ((mod4Mask .|. controlMask, xK_d), spawn "xfce4-appfinder")
        , ((mod4Mask , xK_d), spawn "dmenu_run")
        , ((mod4Mask .|. shiftMask, xK_d), spawn "rofi -show run")  -- an alternative of dmenu
        , ((mod4Mask , xK_Return), spawn "xfce4-terminal")
        ]
