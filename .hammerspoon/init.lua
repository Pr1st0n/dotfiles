hs.loadSpoon("MicMute")

local modifier = {
    cmd = "cmd",
    shift = "shift",
    ctrl = "ctrl",
    option = "alt",
}

local modifiers = {
    hyper = { modifier.cmd, modifier.shift, modifier.ctrl, modifier.option },
    system = { modifier.cmd, modifier.option, modifier.ctrl },
    magnet = { modifier.ctrl, modifier.option },
    option = { modifier.option },
}

local bundleID = {
    -- x o o o o
    -- x o o o o
    -- x o o o o
    pulseSecure = "net.pulsesecure.Pulse-Secure",
    insomnia = "com.insomnia.app",
    finder = "com.apple.finder",

    -- o x o o o
    -- o x o o o
    -- o x o o o
    spotify = "com.spotify.client",
    ONEpassword = "com.1password.1password",
    macpass = "com.hicknhacksoftware.MacPass",

    -- o o x o o
    -- o o x o o
    -- o o x o o
    citrix = "com.citrix.receiver.nomas",
    googleChromeTeams = "com.google.Chrome.app.heimggeelmnffondmjfpamclenidekkp",
    googleChromeOutlook  = "com.google.Chrome.app.klfelhiglhlhfbdkppoigabohcndeloc",

    -- o o o x o
    -- o o o x o
    -- o o o x o
    googleChrome = "com.google.Chrome",
    teams = "com.microsoft.teams2",
    outlook = "com.microsoft.Outlook",

    -- o o o o x
    -- o o o o x
    -- o o o o x
    intellij = "com.jetbrains.intellij",
    openlens = "com.electron.open-lens",
    iterm = "com.googlecode.iterm2",

    -- Other
    systemPreferences = "com.apple.systempreferences",
}

-- Audio --
function open_spotify()
    hs.application.launchOrFocusByBundleID(bundleID.spotify)
    device = hs.audiodevice.findDeviceByName("Bose QC35 II")
    if device == nil then
        return
    end
    hs.alert.show("Audio out: " .. device:name())
    device:setDefaultOutputDevice()
end

local teams = {}
teams.bindHotKey = function(key)
    return function()
        if not teams.app then
            teams.app = hs.application.get(bundleID.teams)
            if not teams.app then
                hs.application.launchOrFocusByBundleID(bundleID.teams)
                teams.app = hs.application.get(bundleID.teams)
            end
        end
        hs.eventtap.keyStroke({"cmd", "shift"}, key, 0, teams.app)
    end
end
teams.raiseHand = teams.bindHotKey("k")
teams.toggleCamera = teams.bindHotKey("o")
teams.leave = teams.bindHotKey("h")

-- Push-to-Talk
--spoon.MicMute:bindHotkeys({toggle={modifiers.hyper, "1"}}, 0)
hs.hotkey.bind(modifiers.hyper, "1", function() hs.eventtap.keyStroke(modifiers.option, 'space', 0) end)
hs.hotkey.bind(modifiers.hyper, "2", function() spoon.MicMute:toggleMicMute() end)
-- MS Teams
hs.hotkey.bind(modifiers.hyper, "3", teams.raiseHand)
hs.hotkey.bind(modifiers.hyper, "4", teams.toggleCamera)
hs.hotkey.bind(modifiers.hyper, "5", teams.leave)
-- Application Shortcuts
hs.hotkey.bind(modifiers.hyper, "p", function() hs.application.launchOrFocusByBundleID(bundleID.pulseSecure) end)
--hs.hotkey.bind(modifiers.hyper, "i", function() hs.application.launchOrFocusByBundleID(bundleID.insomnia) end)
hs.hotkey.bind(modifiers.hyper, "f", function() hs.application.launchOrFocusByBundleID(bundleID.finder) end)
--hs.hotkey.bind(modifiers.hyper, "s", open_spotify)
hs.hotkey.bind(modifiers.hyper, "n", function() hs.application.launchOrFocusByBundleID(bundleID.ONEpassword) end)
hs.hotkey.bind(modifiers.hyper, "m", function() hs.application.launchOrFocusByBundleID(bundleID.macpass) end)
hs.hotkey.bind(modifiers.hyper, "c", function() hs.application.launchOrFocusByBundleID(bundleID.citrix) end)
hs.hotkey.bind(modifiers.hyper, "[", function() hs.application.launchOrFocusByBundleID(bundleID.googleChromeTeams) end)
hs.hotkey.bind(modifiers.hyper, "]", function() hs.application.launchOrFocusByBundleID(bundleID.googleChromeOutlook) end)
hs.hotkey.bind(modifiers.hyper, "g", function() hs.application.launchOrFocusByBundleID(bundleID.googleChrome) end)
hs.hotkey.bind(modifiers.hyper, "x", function() hs.application.launchOrFocusByBundleID(bundleID.teams) end)
hs.hotkey.bind(modifiers.hyper, "v", function() hs.application.launchOrFocusByBundleID(bundleID.outlook) end)
hs.hotkey.bind(modifiers.hyper, "w", function() hs.application.launchOrFocusByBundleID(bundleID.intellij) end)
hs.hotkey.bind(modifiers.hyper, "o", function() hs.application.launchOrFocusByBundleID(bundleID.openlens) end)
hs.hotkey.bind(modifiers.hyper, "t", function() hs.application.launchOrFocusByBundleID(bundleID.iterm) end)
hs.hotkey.bind(modifiers.hyper, "a", function() hs.application.launchOrFocusByBundleID(bundleID.systemPreferences) end)


function switch_output()
    for _, device in pairs(hs.audiodevice.allOutputDevices()) do
       hs.alert.show("Audio out: " .. device:name())
    end
end

--hs.hotkey.bind(modifiers.hyper, "j", switch_output)

function positionWindowOnMainScreen(key)
    return function()
        screens = hs.screen.allScreens()
        win = hs.window.focusedWindow()
        delay = 0
        if win:isFullScreen() then
            win:setFullScreen(false)
            delay = 1
        end

        hs.timer.doAfter(delay, function()
            win:moveToScreen(screens[2], true, true, 0)
            hs.eventtap.keyStroke(modifiers.magnet, key, 0)
        end)
    end
end

hs.hotkey.bind(modifiers.hyper, "i", positionWindowOnMainScreen('i'))
hs.hotkey.bind(modifiers.hyper, "k", positionWindowOnMainScreen('k'))
hs.hotkey.bind(modifiers.hyper, "j", positionWindowOnMainScreen('j'))
hs.hotkey.bind(modifiers.hyper, "u", positionWindowOnMainScreen('u'))

-- hs.caffeinate.lockScreen()
hs.hotkey.bind(modifiers.hyper, "s", function()
    hs.eventtap.keyStroke({"ctrl", "cmd"}, "q", 0)
    hs.timer.doAfter(1, function() hs.eventtap.keyStroke({}, "esc", 0) end)

end)

hs.hotkey.bind(modifiers.system, "R", function()
    hs.reload()
end)
hs.alert.show("Config loaded")