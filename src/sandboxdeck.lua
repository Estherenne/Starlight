-- this is an intentionally broken deck that is used for testing
-- effects:
-- 100 hands
-- 100 discards
-- 10,000,000 dollars
-- 200 joker slots
-- start with 10 perkeos and a hanging chad

SMODS.Atlas {
  key = 'star_decks',
  px = 71,
  py = 95,
  path = 'decks.png'
}

SMODS.Back {
  key = 'star_sandbox',
  loc_txt = {
    name = 'Sandbox Deck',
    text = {
      'Check sandboxdeck.lua',
      'for details.',
      'Intentionally unbalanced.'
    }
  },
  atlas = 'star_decks',
  pos = { x = 0, y = 2 },
  config = {
    hands = 96,
    discards = 97,
    dollars = 9999996,
    joker_slot = 195,
    jokers = {
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_perkeo',
      'j_hanging_chad',
    }
  }
}