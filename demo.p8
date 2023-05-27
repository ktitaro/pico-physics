pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
#include ./src/toolbox/debug.lua
#include ./src/helpers/math.lua
#include ./src/helpers/conv.lua
#include ./src/helpers/vec2.lua
#include ./src/helpers/sat2.lua
#include ./src/shapes/base.lua
#include ./src/shapes/oval2.lua
#include ./src/shapes/rect2.lua
#include ./src/shapes/poly2.lua
#include ./src/physics/area.lua
#include ./src/physics/body.lua
#include ./demo.lua
__gfx__
00000000101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
17777711177777111111111111117771177171717771111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77711771771177711111777111117771717171717111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77111771771117711111111111117171717171717711111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77711771771177711111777111117171717177717111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17777711177777111111111111117171771117117771111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17777711111111111111777171717771777111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77171771111177711111171171717771717111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77717771111111111111171171717171777111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77171771111177711111171171717171711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17777711111111111111771117717171711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77717711111111117111717111111111777177711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
71711711171111117111717111111111717171711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
77711711111111117771777111111111777171711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
71111711171111117171117117111111117171711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
71117771111111117771117171111111117177711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
17711771711171117771177177711771771111111111771177111771111177711111111177711111111111111111111111111111111111111111111111111111
71117171711171111711711117117171717117111111711117111171111171711111111171711111111111111111111111111111111111111111111111111111
71117171711171111711777117117171717111111111711117111171111171711111111171711111111111111111111111111111111111111111111111111111
71117171711171111711117117117171717117111111711117111171111171711711111171711111111111111111111111111111111111111111111111111111
17717711777177717771771177717711717111111111771177711771111177717111111177711111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
bbbbbbbbbbb11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111bbbbbbbbbb
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b1111111111111111111111111111111111111111111111111111bbb1111111111111111111111111111111111111111111111111111b111111111
b111111111b1111111111111111111111111111111111111111111111111bbb111bb11111111111111111111111111111111111111111111111111b111111111
b111111111b1111111111111111111111111111111111111111111111111b1111111b1111111111111111111111111111111111111111111111111b111111111
b111111111b1111111111111111111111111111111111111111111111111b1111111b1111111111111111111111111111111111111111111111111b111111111
b111111111b111111111111111111111111111111111111111111111111b111111111b111111111111111111111111111111111111111111111111b111111111
b111111111b111111111111111111111111111111111111111111111111b111111111b111111111111111111111111111111111111111111111111b111111111
b111111111b111111111111111111111111111111111111111111111111b11111111b1111111111111111111111111111111111111111111111111b111111111
b111111111b1111111111111111111111111111111111111111111111111b1111111b1111111111111111111111111111111111111111111111111b111111111
b111111111b1111111111111111111111111111111111111111111111111b111111b11111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111bb11bb111111111111111111111111111111111111111111111111111b111111111
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
b111111111b11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111b111111111
bbbbbbbbbbb11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111bbbbbbbbbb
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111

__gff__
0001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0100000000000000000000000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
