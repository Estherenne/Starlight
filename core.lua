assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/seals.lua"))()

SMODS.Atlas {
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32,
}