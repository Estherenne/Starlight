-- Sine Wave
SMODS.Atlas {
  key = 'star_sinewave',
  px = 71,
  py = 95,
  path = 'sinewave.png',
}

SMODS.Joker {
  key = 'star_sine_wave',
  loc_txt = {
    name = 'Sine Wave',
    text = {
      '{C:white,X:mult}X5{} Mult if the number',
      'of Chips is divisible by {C:attention}24{}'
    }
  },
  pools = {
    ["starlight-addition"] = true,
  },
  atlas = 'sinewave',
  pos = { x = 0, y = 0 },
  rarity = 3,
  cost = 8,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main then
      if hand_chips % 24 == 0 then
        print('[Starlight] Sine Wave: triggered')
        return {
          xmult = 5
        }
      end
    end
  end,
  credits = {
    art = "Esther",
    code = "Esther",
    idea = "Esther",
  }
}

-- Niko
SMODS.Atlas {
  key = 'star_niko',
  px = 71,
  py = 95,
  path = 'niko.png',
}

SMODS.Joker {
  key = 'star_niko',
  loc_txt = {
    name = 'Niko',
    text = {
      'Played {C:attention}face{} cards',
      'with {C:diamonds}Diamond{} suit',
      'give {X:mult,C:white}X3{} Mult and become {C:attention}Glass{}',
    },
  },
  pools = {
    ["starlight-addition"] = true,
  },
  atlas = 'star_niko',
  pos = { x = 0, y = 0 },
  rarity = 4,
  cost = 12,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual then
      print('[Starlight] Niko: context matches')
      if (context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13) and context.other_card:is_suit('Diamonds') then
        print('[Starlight] Niko: suit matches')
        print('[Starlight] Niko: ' .. context.other_card:get_id() .. ' is scored card id')
        context.other_card:set_ability('m_glass')
        print('[Starlight] Niko: set card enhancement to glass')
        return {
          xmult = 3
        }
      end
    end
  end,
  credits = {
    art = "Esther",
    code = "Esther",
    idea = "Esther",
  }
}

-- jokerpoker balala
SMODS.Atlas {
  key = 'star_balala',
  px = 71, 
  py = 95,
  path = 'balala.png'
}

SMODS.Joker {
  key = 'star_balala',
  loc_txt = {
    name = 'jokerpoker balala',
    text = {
      '{C:mult}+2{} Mult for every {C:attention}7{} cards',
      'remaining in deck',
    },
  },
  pools = {
    ["starlight-addition"] = true,
  },
  atlas = 'star_balala',
  pos = { x = 0, y = 0 },
  rarity = 2,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = math.floor(#G.deck.cards / 7) * 2
      }
    end
  end,
  credits = {
    art = "Rayquandia",
    code = "Esther",
    idea = "Esther",
  }
}

-- five little jokers jumping on the bed
SMODS.Atlas {
  key = 'star_fivejokers',
  px = 71,
  py = 95,
  path = 'fivejokers.png'
}

SMODS.Joker {
  key = 'star_fivejokers',
  loc_txt = {
    name = '5 little jokers jumping on the bed',
    text = {
      'For each {C:attention}5{} held in hand,',
      'gain {C:mult}+5{} mult',
    },
  },
  pools = {
    ["starlight-addition"] = true,
  },
  atlas = 'star_fivejokers',
  pos = { x = 0, y = 0 },
  rarity = 2,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 5 then
      return {
        mult = 5,
      }
    end
  end,
  credits = {
    art = "Rayquandia",
    code = "Esther",
    idea = "Esther",
  }
}

-- Slot Machine
SMODS.Joker {
  key = 'star_slotmachine',
  loc_txt = {
    name = 'Slot Machine',
    text = {
      'Each scored {C:attention}7{} has a {C:green}#1# in 3{}',
      'chance to become {C:attention}Lucky{}'
    },
  },
  pools = {
    ["starlight-addition"] = true,
  },
  config = { extra = { odds = 3 } },
  rarity = 2,
  blueprint_compat = false,
  loc_vars = function(self, info_queue, card)
    local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'star_slotmachine')
    return { vars = { numerator, denominator } }
  end,
  calculate = function(self, card, context)
    if context.cardarea == G.play and context.individual and context.other_card:get_id() == 7 and not context.blueprint and
      SMODS.pseudorandom_probability(card, 'star_slotmachine', 1, card.ability.extra.odds) then
      context.other_card:set_ability('m_lucky')
    end
  end,
  credits = {
    code = "Esther",
    idea = "Esther",
  }
}

-- Soen
SMODS.Joker {
  key = 'star_soen',
  loc_txt = {
    name = 'Soen',
    text = {
      'This joker gains {C:white,X:mult}X0.5{} Mult',
      'when each played {C:attention}7{} is scored',
      '{C:inactive}(Currently {C:white,X:mult} X#1# {C:inactive} Mult)'
    },
  },
  pools = {
    ["starlight-addition"] = true,
  },
  config = { extra = { Xmult_gain = 0.5, Xmult = 1 } },
  rarity = 4,
  cost = 10,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult }  }
	end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:get_id() == 7 and not context.blueprint then
      card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
      return {
        message = 'Upgraded!',
        colour = G.C.RED
      }
    elseif context.joker_main then
      return {
        xmult = card.ability.extra.Xmult
      }
    end
  end,
  credits = {
    idea = 'Esther',
    code = 'Esther'
  }
}

-- Triton
SMODS.Joker {
  key = 'star_triton',
  loc_txt = {
    name = 'Triton',
    text = {
      'Gives 10% of total cash',
      'as {C:white,X:mult}XMult{}',
      'At the end of shop, lose 5%',
      'of cash.',
      '{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)'
    }
  },
  pools = {
    ['starlight-addition'] = true,
  },
  config = { extra = { Xmult = 1 } },
  rarity = 4,
  cost = 10,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult }  }
	end,
  calculate = function(self, card, context)
    if context.final_scoring_step then
      card.ability.extra.Xmult = math.floor(G.GAME.dollars / 10)
      if math.floor(G.GAME.dollars / 10) < 2 then card.ability.extra.Xmult = 1 end
      return {
        xmult = card.ability.extra.Xmult
      }
    end
    if context.ending_shop then
      card.ability.extra.Xmult = math.floor(G.GAME.dollars / 10)
      if math.floor(G.GAME.dollars / 10) < 2 then card.ability.extra.Xmult = 1 end
      return {
        dollars = -math.floor(G.GAME.dollars / 20)
      }
    end
    if context.discard or context.pre_joker or context.buying_card or context.selling_card or context.reroll_shop or context.using_consumeable then
      card.ability.extra.Xmult = math.floor(G.GAME.dollars / 10)
      if math.floor(G.GAME.dollars / 10) < 2 then card.ability.extra.Xmult = 1 end
    end
  end,
  credits = {
    code = "Esther",
    idea = "illusion2",
  }
}

-- Paycheck
SMODS.Joker {
  key = 'star_paycheck',
  loc_txt = {
    name = 'Paycheck',
    text = {
      'This joker gains {C:chips}+5{} Chips when',
      'each played {C:chips}Bonus{} card is scored',
      '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)'
    }
  },
  pools = {
    ['starlight-addition'] = true,
  },
  config = { extra = { chips = 0, chip_gain = 5 } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.chips }  }
	end,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.config.center.key == 'm_bonus' and not context.blueprint then
      card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
      return {
        message = 'Upgraded!',
        colour = G.C.RED,
      }
    end
    if context.joker_main then
      return {
        chips = card.ability.extra.chips,
      }
    end
  end,
}

-- Fliegen
SMODS.Joker {
  key = 'star_fliegen',
  loc_txt = {
    name = 'Fliegen',
    text = {
      'Every played {C:attention}Mult Card{}',
      'permanently gains',
      '{C:mult}+3{} Mult when scored'
    }
  },
  pools = {
    ['starlight-addition'] = true
  },
  config = { extra = { mult = 3 } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card.config.center.key == 'm_mult' then
      context.other_card.ability.perma_mult = (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
      return {
        message = 'Upgraded!',
        colour = G.C.RED
      }
    end
  end,
  credits = {
    code = 'Esther',
    idea = 'illusion2'
  }
}

-- Lion Joker
SMODS.Joker {
  key = 'star_lion',
  loc_txt = {
    name = 'Lion Joker',
    text = {
      'Gains {C:white,X:mult}X0.1{} Mult for',
      'each played {C:attention}Wild Card{}',
      '{C:inactive}(Currently {C:white,X:mult}X#1#{C:inactive} Mult)'
    }
  },
  pools = {
    ['starlight-addition'] = true
  },
  config = { extra = { Xmult = 1, Xmult_gain = 0.1 } },
  rarity = 2,
  cost = 6,
  blueprint_compat = true,
  loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult }  }
	end,
  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local add = 0
      for k, v in pairs(G.play.cards) do
        if SMODS.has_enhancement(v, "m_wild") then
          add = add + 1
        end
      end
      for i = 1, add do
        card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_gain
      end
    end
    if context.final_scoring_step then
      return {
        xmult = card.ability.extra.Xmult
      }
    end
  end
  credits = {
    idea = 'ibra',
    code = 'Revo'
  }
}