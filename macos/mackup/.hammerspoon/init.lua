hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.x = f.x - 10
    f.y = f.y - 10
    win:setFrame(f)
  end)
  
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.y = f.y - 10
    win:setFrame(f)
  end)
  
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.x = f.x + 10
    f.y = f.y - 10
    win:setFrame(f)
  end)
  
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.x = f.x - 10
    win:setFrame(f)
  end)
  
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.x = f.x + 10
    win:setFrame(f)
  end)
  
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.x = f.x - 10
    f.y = f.y + 10
    win:setFrame(f)
  end)
  
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.y = f.y + 10
    win:setFrame(f)
  end)
  
  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
  
    f.x = f.x + 10
    f.y = f.y + 10
    win:setFrame(f)
  end)


  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  end)

  hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()
  
    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  end)

hs.hotkey.bind({"cmd","alt","ctrl"}, "s",
function() hs.spotify.displayCurrentTrack() end
, function()  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send() end
, function() hs.spotify.displayCurrentTrack() end
)

hs.loadSpoon("AClock")
spoon.AClock:init()
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  spoon.AClock:toggleShow()
end)

hs.loadSpoon("WindowScreenLeftAndRight")
-- spoon.WindowScreenLeftAndRight:init()
spoon.WindowScreenLeftAndRight.animationDuration=0
spoon.WindowScreenLeftAndRight:bindHotkeys(spoon.WindowScreenLeftAndRight.defaultHotkeys)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
    hs.reload()
  end)
hs.alert.show("Config loaded")