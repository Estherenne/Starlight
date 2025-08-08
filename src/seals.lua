SMODS.Seal {
  key = 'star_azureseal',
  loc_txt = {
    name = 'Azure Seal',
    text = {
      'Creates a Spectral card',
      'if played and unscoring'
    },
  },
  badge_colour = HEX('0038A8'),
  calculate = function(self, card, context)
    if context.cardarea == G.hand and context.end_of_round and context.other_card == card and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
      
    end
  end
}
