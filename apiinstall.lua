--Basalt configurated installer
local filePath = "basalt.lua" --here you can change the file path default: basalt
if not(fs.exists(filePath))then
    local w,h = term.getSize()
    term.clear()
    local _installerWindow = window.create(term.current(),w/2-8,h/2-3,18,6)
    _installerWindow.setBackgroundColor(colors.gray)
    _installerWindow.setTextColor(colors.black)
    _installerWindow.write(" Basalt Installer ")
    _installerWindow.setBackgroundColor(colors.lightGray)
    for line=2,6,1 do
        _installerWindow.setCursorPos(1,line)
        if(line==3)then
            _installerWindow.write(" No Basalt found! ")
        elseif(line==4)then
            _installerWindow.write(" Install it?      ")
        elseif(line==6)then
            _installerWindow.setTextColor(colors.black)
            _installerWindow.setBackgroundColor(colors.gray)
            _installerWindow.write("Install")
            _installerWindow.setBackgroundColor(colors.lightGray)
            _installerWindow.write(string.rep(" ",5))
            _installerWindow.setBackgroundColor(colors.red)
            _installerWindow.write("Cancel")
        else
            _installerWindow.write(string.rep(" ",18))
        end
    end
    _installerWindow.setVisible(true)
    _installerWindow.redraw()
    while(not(fs.exists(filePath))) do
        local event, p1,p2,p3,p4 = os.pullEvent()
        if(event=="mouse_click")then
            if(p3==math.floor(h/2+2))and(p2>=w/2-8)and(p2<=w/2-2)then
                shell.run("pastebin run ESs1mg7P packed true "..filePath:gsub(".lua", ""))
                _installerWindow.setVisible(false)
                term.clear()
                break
            end
            if(p3==math.floor(h/2+2))and(p2<=w/2+9)and(p2>=w/2+4)then
                _installerWindow.clear()
                _installerWindow.setVisible(false)
                term.setCursorPos(1,1)
                term.clear()
                return
            end
        end
    end
    term.setCursorPos(1,1)
    term.clear()
end

local basalt = require(filePath:gsub(".lua", "")) -- here you can change the variablename in any variablename you want default: basalt
------------------------------

local mainFrame = basalt.createFrame("apiinstallframe"):setBackground(colors.blue)

local aLabel1 = mainFrame:addLabel():setText("API for Big Screens Installer v.1.0")
local aLabel2 = mainFrame:addLabel():setText("Made By Nextronics Software"):setPosition(1,2)

local subFrame = mainFrame:addFrame():setBar("API Selection Window",colors.black,colors.lightGray):setBarTextAlign("left"):setSize(30,15):setPosition(12,4):showBar():setMoveable(true)

local subSubFrame = subFrame:addFrame():setSize(17,12):setPosition(13, 3):setBackground(colors.lightGray)

local aButton1 = subFrame:addButton():setText("Chromy"):setSize(6,3):setPosition(3, 3):setBackground(colors.orange):show()

aButton1:onClick(function(self,event,button,x,y)
  if(event=="mouse_click")and(button==1)then
    shell.run('wget https://gist.githubusercontent.com/1Turtle/cc1f6973be9d99647953759e1eaaa759/raw/08946f0601592775756892cac87dca3231980b2d/chromy.lua')
  end
end)

local aButton2 = subFrame:addButton():setText("Stitch"):setSize(6,3):setPosition(3, 7):setBackground(colors.orange):show()

aButton2:onClick(function(self,event,button,x,y)
  if(event=="mouse_click")and(button==1)then
    shell.run('pastebin get sNxkB0YV stitch')

  end
end)

local aButton3 = subFrame:addButton():setText("Blbfor"):setSize(6,3):setPosition(3, 11):setBackground(colors.orange):show()

aButton3:onClick(function(self,event,button,x,y)
  if(event=="mouse_click")and(button==1)then
    shell.run('wget https://raw.githubusercontent.com/9551-Dev/BLBFOR/main/blbfor.lua')

  end
end)

local description1 = subSubFrame:addLabel():setText("Chromy- API for rendering bimg Files"):setSize(15,2)
local description1 = subSubFrame:addLabel():setText("Stitch- API for Multimonitor Support"):setSize(15,2):setPosition(1,4)
local description1 = subSubFrame:addLabel():setText("Blbfor- API for rendering bbf Files"):setSize(15,2):setPosition(1,7)

local aButton = mainFrame:addButton():setBackground(colors.red):setSize(5,5):setPosition(44,14):setText("Close")
aButton:onClick(function()
basalt.autoUpdate(false)
shell.run('clear')
end)
basalt.autoUpdate()