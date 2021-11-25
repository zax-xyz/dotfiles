#!/usr/bin/env python
alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890()-'
sup_alpha = 'ᵃᵇᶜᵈᵉᶠᵍʰᶦʲᵏˡᵐⁿᵒᵖᵠʳˢᵗᵘᵛʷˣʸᶻᴬᴮᶜᴰᴱᶠᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾᵠᴿˢᵀᵁⱽᵂˣʸᶻ¹²³⁴⁵⁶⁷⁸⁹⁰⁽⁾⁻'

d = str.maketrans(dict(zip(alpha, sup_alpha)))

print(open(0).read().translate(d), end='')
