--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

aura_env.ids={ArcaneExplosion=2668 -1219 ,Blizzard=191993 -(1523 + 114) ,CometStorm=138030 + 15565 ,ConeOfCold=171 -51 ,Flurry=45679 -(68 + 997) ,Freeze=33395,FrostNova=1392 -(226 + 1044) ,FrostfireBolt=431044,FrozenOrb=368878 -284164 ,Frostbolt=233 -(32 + 85) ,GlacialSpike=195792 + 3994 ,IceLance=6754 + 23701 ,IceNova=158954 -(892 + 65) ,IcyVeins=29751 -17279 ,RayOfFrost=378967 -173946 ,ShiftingPower=702094 -319654 ,ColdestSnapTalent=417493,ColdFrontTalent=382460 -(87 + 263) ,CometStormTalent=153595,DeathsChillTalent=450511 -(67 + 113) ,DeepShatterTalent=277727 + 101022 ,ExcessFrostTalent=1076861 -638250 ,FreezingRainTalent=198744 + 71489 ,FreezingWindsTalent=1518663 -1136560 ,FrostfireBoltTalent=431996 -(802 + 150) ,FrozenTouchTalent=552010 -346980 ,IceCallerTalent=429295 -192633 ,IsothermicCoreTalent=313790 + 117305 ,RayOfFrostTalent=206018 -(915 + 82) ,SlickIceTalent=1082069 -699925 ,SplinteringColdTalent=220814 + 158235 ,SplinteringRayTalent=418733,SplinterstormTalent=583583 -139841 ,BrainFreezeBuff=191633 -(1069 + 118) ,DeathsChillBuff=1030836 -576465 ,ExcessFireBuff=959477 -520853 ,ExcessFrostBuff=76252 + 362359 ,FingersOfFrostBuff=79145 -34601 ,FreezingRainBuff=270232,FrostfireEmpowermentBuff=431177,IciclesBuff=203830 + 1643 ,IcyVeinsBuff=12472,SpymastersWebBuff=444959,WintersChillDebuff=229149 -(368 + 423) };aura_env.GetSpellCooldown=function(v3) local v4=0 -0 ;local v5;local v6;while true do if (v4==(18 -(10 + 8))) then v5=C_Spell.GetSpellCooldown(v3);v6=C_Spell.GetSpellCharges(v3);v4=1;end if (v4==1) then if v6 then local v10=0;local v11;while true do if ((0 -0)==v10) then v11=((v6.currentCharges<v6.maxCharges) and ((v6.cooldownStartTime + v6.cooldownDuration) -GetTime())) or (442 -(416 + 26)) ;return v6.currentCharges,v11,v6.maxCharges;end end elseif v5 then local v12=0 -0 ;local v13;while true do if (v12==(0 + 0)) then v13=(v5.startTime and v5.duration and math.max((v5.startTime + v5.duration) -GetTime() ,0 -0 )) or 0 ;return 438 -(145 + 293) ,v13,430 -(44 + 386) ;end end else return 0,0,1486 -(998 + 488) ;end break;end end end;aura_env.GetSafeSpellIcon=function(v7) local v8=0 + 0 ;local v9;while true do if (v8==1) then return (v9 and v9.iconID) or (0 + 0) ;end if (v8==(772 -(201 + 571))) then if ( not v7 or (v7==(1138 -(116 + 1022)))) then return 0 -0 ;end v9=C_Spell.GetSpellInfo(v7);v8=1 + 0 ;end end end;