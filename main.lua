local emojis = require"scb_table"
local ranges = emojis.ranges

local function gsubfunc(emoji_unicode)
    local scb_emoji = emojis[emoji_unicode]
    if scb_emoji then
        return ":"..scb_emoji..":"
    end
end

local function convertAllUniEmojis2SCB(text)
    for k,v in ipairs(ranges) do
        text = text:gsub(v, gsubfunc)
    end
    return text
end


-- tests
assert(convertAllUniEmojis2SCB("😎👨🏿‍🤝‍👨🏾") == ":sunglasses::two_men_holding_hands:")
assert(convertAllUniEmojis2SCB("Minge with -> 🔇") == "Minge with -> :mute:")
assert(convertAllUniEmojis2SCB("made with ❤️") == "made with :heart:")
