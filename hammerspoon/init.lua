--- start quick open applications 
function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications


--[[ 
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "i", open_app("iTerm")) 
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "o", open_app("Google Chrome"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "p", open_app("Obsidian"))

hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, ";", open_app("KeyMapp"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "k", open_app("Visual Studio Code"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "l", open_app("IntelliJ IDEA 2023.3 EAP"))

hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "8", open_app("Microsoft Teams (work or school)"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "0", open_app("Microsoft Outlook"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "9", open_app("KeepassXC")) ]]


hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "u", open_app("iTerm")) 
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "o", open_app("Google Chrome"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "y", open_app("Obsidian"))

hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "i", open_app("KeyMapp"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "a", open_app("Visual Studio Code"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "e", open_app("IntelliJ IDEA 2023.3 EAP"))

hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "8", open_app("Microsoft Teams (work or school)"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "0", open_app("Microsoft Outlook"))
hs.hotkey.bind({"alt", "shift", "cmd", "ctrl"}, "9", open_app("KeepassXC"))
--- end quick open applications˛˛˛˛˛˛˛˛