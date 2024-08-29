-- THINGS I WANT TO LEARN / HAVE LEARNT IN LUA (13/08/24) --
-- AS OF 13th August 2024 I KNOW 71% OF THE EXPLOIT ENVIROMENT FUNCTIONS! -- 

local a = {
   ["Drawing Library"] = {
     ["Drawing.new"] = true,
     ["cleardrawcache"] = true,
     ["getrenderproperty"] = true,
     ["isrenderobj"] = true,
     ["setrenderproperty"] = true
   },
 
   ["WebSocket"] = {
     ["WebSocket.connect"] = false
   },
 
   ["Cache"] = {
     ["invalidate"] = false,
     ["iscached"] = false,
     ["replace"] = true,
     ["cloneref"] = true,
     ["compareinstances"] = true
   },
 
   ["Closures"] = {
     ["checkcaller"] = true,
     ["clonefunction"] = true,
     ["getcallingscript"] = true,
     ["hookfunction"] = true,
     ["iscclosure"] = false,
     ["islclosure"] = false,
     ["isexecutorclosure"] = true,
     ["loadstring"] = true,
     ["newcclosure"] = true
   },
 
   ["Console"] = {
     ["rconsoleclear"] = true,
     ["rconsolecreate"] = true,
     ["rconsoledestroy"] = true,
     ["rconsoleinput"] = true,
     ["rconsoleprint"] = true,
     ["rconsolesettitle"] = true
   },
 
   ["Crypt"] = {
     ["crypt.base64encode"] = false,
     ["crypt.base64decode"] = false,
     ["crypt.encrypt"] = false,
     ["crypt.decrypt"] = false,
     ["crypt.generatebytes"] = false,
     ["crypt.generatekey"] = false,
     ["crypt.hash"] = false,
   },
 
   ["Debug"] = {
     ["debug.getconstant"] = true,
     ["debug.getconstants"] = true,
     ["debug.getinfo"] = true,
     ["debug.getproto"] = false,
     ["debug.getprotos"] = false,
     ["debug.getstack"] = false,
     ["debug.getupvalue"] = true,
     ["debug.getupvalues"] = true,
     ["debug.setconstant"] = true,
     ["debug.setstack"] = false,
     ["debug.setupvalue"] = true
   },
 
   ["Filesystem"] = {
     ["readfile"] = true,
     ["listfiles"] = true,
     ["writefile"] = true,
     ["makefolder"] = true,
     ["appendfile"] = true,
     ["isfile"] = true,
     ["isfolder"] = true,
     ["delfile"] = true,
     ["delfolder"] = true,
     ["loadfile"] = true,
     ["dofile"] = true
   },
 
   ["Input"] = {
     ["isrbxactive"] = true,
     ["mouse1click"] = true,
     ["mouse1press"] = true,
     ["mouse1release"] = true,
     ["mouse2click"] = true,
     ["mouse2press"] = true,
     ["mouse2release"] = true,
     ["mousemoveabs"] = true,
     ["mousemoverel"] = false,
     ["mousescroll"] = true
   },
 
   ["Instances"] = {
     ["fireclickdetector"] = true,
     ["fireproximityprompt"] = true,
     ["firetouchinterest"] = true,
     ["getcallbackvalue"] = false,
     ["getconnections"] = false,
     ["getcustomasset"] = false,
     ["gethiddenproperty"] = false,
     ["gethui"] = false,
     ["getinstances"] = true,
     ["getnilinstances"] = true,
     ["isscriptable"] = false,
     ["sethiddenproperty"] = false,
     ["setrbxclipboard"] = true,
     ["setscriptable"] = false,
   },
 
   ["Metatable"] = {
     ["getrawmetatable"] = true,
     ["hookmetamethod"] = true,
     ["getnamecallmethod"] = true,
     ["isreadonly"] = true,
     ["setrawmetatable"] = true,
     ["setreadonly"] = true
   },
 
   ["Miscellaneous"] = {
     ["identifyexecutor"] = true,
     ["lz4compress"] = false,
     ["lz4decompress"] = false,
     ["messagebox"] = true,
     ["queue_on_teleport"] = true,
     ["request"] = true,
     ["setclipboard"] = true,
     ["setfpscap"] = true
   },
 
   ["Scripts"] = {
     ["getgc"] = true,
     ["getgenv"] = true,
     ["getloadedmodules"] = true,
     ["getrenv"] = true,
     ["getrunningscripts"] = true,
     ["getscriptbytecode"] = false,
     ["getscriptclosure"] = false,
     ["getscripthash"] = false,
     ["getscripts"] = true,
     ["getsenv"] = true,
     ["getthreadidentity"] = true,
     ["setthreadidentity"] = true
   }
 }
 
 local KnownFunctions = 0
 local AmountOfFunctions = 0
 
 
 for c,d in a do 
    if type(d) == "table" then 
        for e,f in d do 
            if f then 
                KnownFunctions = KnownFunctions + 1
            end
            AmountOfFunctions = AmountOfFunctions + 1
        end
    end
end


local MyUncPercent = math.floor(KnownFunctions / AmountOfFunctions * 100)
print("I know: " .. tostring(MyUncPercent) .. "%" .. " of the exploit enviroment functions!")
