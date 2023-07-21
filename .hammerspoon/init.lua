hs.loadSpoon("MicMute")

local modifier = {
    cmd = "cmd",
    shift = "shift",
    ctrl = "ctrl",
    option = "alt",
}

local modifiers = {
    hyper = { modifier.cmd, modifier.shift, modifier.ctrl, modifier.option },
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
    googleChromeTeams = "com.google.Chrome.app.gbmhnjmebenpfledimpoeiggomiakkch",
    googleChromeOutlook  = "com.google.Chrome.app.gflijhdoljchjcanmdpngeepcnjmlaho",

    -- o o o x o
    -- o o o x o
    -- o o o x o
    googleChrome = "com.google.Chrome",
    outlook = "com.microsoft.Outlook",
    teams = "com.microsoft.teams",

    -- o o o o x
    -- o o o o x
    -- o o o o x
    intellij = "com.jetbrains.intellij",
    openlens = "com.electron.open-lens",
    iterm = "com.googlecode.iterm2",

    -- Other
    systemPreferences = "com.apple.systempreferences",
}

-- Push-to-Talk
spoon.MicMute:bindHotkeys({toggle={modifiers.hyper, "1"}}, 0)
hs.hotkey.bind(modifiers.hyper, "2", function() spoon.MicMute:toggleMicMute() end)
-- Application Shortcuts
hs.hotkey.bind(modifiers.hyper, "p", function() hs.application.launchOrFocusByBundleID(bundleID.pulseSecure) end)
hs.hotkey.bind(modifiers.hyper, "i", function() hs.application.launchOrFocusByBundleID(bundleID.insomnia) end)
hs.hotkey.bind(modifiers.hyper, "f", function() hs.application.launchOrFocusByBundleID(bundleID.finder) end)
hs.hotkey.bind(modifiers.hyper, "s", function() hs.application.launchOrFocusByBundleID(bundleID.spotify) end)
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
