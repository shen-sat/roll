pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function _init()
 game = {}
 #include profile.lua
 #include stats.lua
 #include todo_list.lua
 #include dice.lua
 #include instructions.lua

 start_game()
end

function _update()
 game.update()
end

function _draw()
 game.draw() 
end

function start_game()
  game.update = start_game_update
  game.draw = start_game_draw
end

function start_game_update()

end

function start_game_draw()
  cls(13)
  profile:draw()
  stats:draw()
  todo_list:draw()
  for die in all(dice) do
    rectfill(die.x0,die.y0,calculate_x1(die.x0, die.width),calculate_y1(die.y0,die.width),9)
  end
  print(instructions, 2, 128 - 6, 7)
end

function calculate_x1(x0, width)
  return x0 + width - 1
end

function calculate_y1(y0, height)
  return y0 + height - 1
end

__sfx__
490a0000055500000005550010000f5500f5550555005500055501f00005550181000e550110000f5500f500055500700005550273000f5500f55505550055000555023200055502f6000f5550a5550555005500
490a0000055500000005550010000f5500f5550555005500055501f00005550181000e550110000f5500f500055500700005550273000f5500f55505550055000555023200055502f60005550055000555005500
490a0000055500000005550010000f5500f5550555005500055501f00005550181000e550110000f5500f500055500700005550273000f5500f55505550055000e55111551055502f6000c5500a5000555005500
490a0000055500000005550010000f550020000555005500055501f00005550181000e550110000f5500f5001a3000550011550273000f5501e20005550055000755023200055502f60011550115000a50005500
490a0000055500000005550010000f5500f5550555005500055501f00005550181000e550110000f5500f500055500700005550273000f5500f55505550055000555023200055502f60005550055000555005500
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
490a0000085500300008550040000f5500f55508550085000855022000085501b100115501400008550125000a550050000a5502a30011550115550a550085000c5500c0000c5503260014550085001355008500
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
490a00000c0333f2000c0001830024613000030c023000030c033000030c0231830024613183003f200000030c0330c0000c0230c02324613183000c023000030c033000030c0230c00024613000031831300003
490a00000c0330c0000c0230c02324613000030c023000030c033000030c0230c000246130000300003000030c0330c0000c0230c02324613000030c023000030c033000030c0230c00024613000030000300003
050a000020750207511f7511d7511d7511d7511f7002070027750277551f700207001f7501f75020750207511f7511d7511d7511d7512770027700277502775500000337001d750207001f755207002075020750
050a000020750207511d7511d7511d7510000027700247002975500000277002470027755247002475500000000002770027755207001f7552070020755000002275524700247552470029725247002772500000
050a000020750207511f7511d7511d7511d7511f7002070027750277551f70020700297402974024740247411f7412274122741227512770027700207502075500000337001d750207001b755207001f7501f750
050a000024750247512575125751247512475125751257512475124751257512575120751207512275122751000002470022750227502270020700207502075020700007001f7401f7401b7401b7401873018730
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
49190000110441104518044180451c0441c0451804418045110441104518044180451c0441c04518044180450e0440e0451504415045180441804515044150450e0440e045150441504518044180450e0440e045
49190000130441304516044160451d0441d0451604416045130441304516044160451c0441c0451604416045110441104518044180451c0441c0451804418045110441104518044180451c0441c0421c0421c045
49190000110441104518044180451c0441c0451804418045110441104518044180451c0441c04518044180450e0440e04515044150451d0441d04515044150451c0441c045150441504518044180451a0441a045
4919000016044160451a0441a0451d0441d045160441604518044180451f0441f0451d0441d0451c0441c0451104411045150441504518044180451c0441c0451d0441d0451a0001a0001d0001d0001f0001f000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
491400000e0440e0451504415045180441804515044150450e0440e0451504415045180441804515044150450e0440e04515044150451d0441d04515044150451c0441c045150441504518044180451a0441a045
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6b1900002153021531215222152221522215251f50024530285302853128522285252850028500235002953028530285312852228522285222852522500245302153021530215302152021520215250c50021530
6b190000215302153022530225351f5301f5351d5301d5351f5301f5301f5221f5221f5251f500235001d5301f530215302153021530215302152021520215150050000500005000050000500005000050000500
6b190000215302153021530215351f500205001f5002453028530285302853529500295302953029535295002b5302b5302b535255002953029535285302853524530245302453024520245150c5000c50024530
6b19000022530225302453024535265302653529530295352b5302b5302b5302b5352953029535285302853529530295302953029530295202952029515285002450024500245000c5000c5000c5000c50024500
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003000f2a7412a7412a7412a7412a7402a7402a7402a74524740247402474024740247402474024740247400774003740007400074000740007400074007700077000370003700007000a7000a7000770005700
__music__
01 00420844
00 01420844
00 02420844
00 03424344
01 000a0844
00 060b0844
00 020c0844
02 060d0844
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
01 141e4344
00 151f4344
00 16204344
02 17214344
00 54424344
00 55424344
00 56424344
02 57424344
