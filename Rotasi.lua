--/ Pengaturan /--
seedId = 163;
blockId = 162;

amount_to_plant = 10; --/ Auto plant when (n) seed reached | Otomatis menanam saat (n) biji tercapai 


--[[
    TO DO:-[-]
    - When not harvest or breaking, script will do a plant mode, (will be priority this mode)
    - When is not planting or harvesting, script will do break mode, (this can be working while plant on a time to be harvest)
    - When seed is ready to harvest, script will harvesting all of it & collect, drop to somewhere, and back to planting mode
]]
is_planting = false;
is_harvesting = false;
is_breaking = false;

--/ Kode sampingan /--
function _concat(t, suffix)
    local suffix = suffix or " "
    local s = "";
    for _,v in pairs(t) do
        s = s .. tostring(v) .. suffix;
    end
    return s;
end

function log(...)
    local args = {...};
    return LogToConsole(_concat(args));
end



--/ Main /--

--[[
    PLANT RAW PACKET:
    type: 0,
    py: -1,
    netid: 0,
    y: posY,
    x: posX,
    state: 32, --/ CLICK ?
    value: 0,
    px: -1
]]

for _,v in pairs(GetInventory()) do
    if (not is_planting and not is_harvesting and not is_breaking) and v.id == seedId then
        is_planting = true;
    end
end