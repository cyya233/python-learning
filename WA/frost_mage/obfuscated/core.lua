--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

function() if (aura_env.LastUpdate and (aura_env.LastUpdate>(GetTime() -aura_env.config['UpdateFrequency']))) then return;end aura_env.LastUpdate=GetTime();local v2=GetTime();local v3=aura_env.OffCooldown;local v4=aura_env.OffCooldownNotCasting;local v5=aura_env.GetRemainingAuraDuration;local v6=aura_env.GetRemainingDebuffDuration;local v7=aura_env.GetRemainingSpellCooldown;local v8=aura_env.IsCasting;local v9=aura_env.GetPlayerStacks;local v10=aura_env.GetTargetStacks;local v11=aura_env.PlayerHasBuff;local v12=aura_env.TargetHasDebuff;local v13=aura_env.HasBloodlust;local v14=aura_env.GetSpellChargesFractional;local v15=aura_env.GetTimeToNextCharge;local v16=aura_env.GetTimeToFullCharges;local v17=aura_env.TargetTimeToXPct;local v18=aura_env.FightRemains;local v19=aura_env.IsAuraRefreshable;local v20=aura_env.KTrig;local v21=aura_env.ids;aura_env.OutOfRange=false;local v23={};local v24=WeakAuras.GetNumSetItemsEquipped(2550 -(814 + 45) );local v25=UnitPower("player",Enum.PowerType.Mana);local v26=UnitPowerMax("player",Enum.PowerType.Mana);local v27=0;local v28=40;for v40=2 -1 ,3 + 37  do local v41="nameplate"   .. v40 ;if (UnitExists(v41) and  not UnitIsFriend("player",v41) and WeakAuras.CheckRange(v41,v28,"<=") and (UnitAffectingCombat(v41) or aura_env.config['BypassCombatRequirement'])) then v27=v27 + 1 + 0 ;end end local v29=v9(v21.IciclesBuff);if v8(v21.Frostbolt) then v29=min(v29 + (886 -(261 + 624)) ,5);elseif v8(v21.GlacialSpike) then v29=0;end if ((UnitExists("target")==false) or (UnitCanAttack("player","target")==false)) then WeakAuras.ScanEvents("K_GLOW_EXCLUSIVE",{});v20("Clear",nil);return;end local v30={};if (v3(v21.IcyVeins) and (v5("player",v21.IcyVeinsBuff)<(max((1.5 -0)/((1081 -(1020 + 60)) + ((1423.01 -(630 + 793)) * UnitSpellHaste("player"))) ,0.75 -0 ) * (9 -7)))) then v30.IcyVeins=true;end WeakAuras.ScanEvents("K_GLOW_EXCLUSIVE",v30,nil);v23.Boltspam=(IsPlayerSpell(v21.SplinterstormTalent) and IsPlayerSpell(v21.ColdFrontTalent) and IsPlayerSpell(v21.SlickIceTalent) and IsPlayerSpell(v21.DeathsChillTalent) and IsPlayerSpell(v21.FrozenTouchTalent)) or (IsPlayerSpell(v21.FrostfireBoltTalent) and IsPlayerSpell(v21.DeepShatterTalent) and IsPlayerSpell(v21.SlickIceTalent) and IsPlayerSpell(v21.DeathsChillTalent)) ;v23.TargetIsFrozen=v12(v21.IceNova) or v12(v21.Freeze) or v12(v21.FrostNova) ;local v33=function() local v42=0 + 0 ;while true do if (v42==(3 -2)) then if (v3(v21.ArcaneExplosion) and (((v25/v26) * 100)>(1777 -(760 + 987))) and (v27>=2)) then v20("Arcane Explosion");return true;end if v3(v21.IceLance) then v20("Ice Lance");return true;end break;end if (v42==0) then if v3(v21.IceNova) then local v78=1913 -(1789 + 124) ;while true do if (v78==(766 -(745 + 21))) then v20("Ice Nova");return true;end end end if (v3(v21.ConeOfCold) and  not IsPlayerSpell(v21.ColdestSnapTalent) and (v27>=(1 + 1))) then v20("Cone of Cold");return true;end v42=1;end end end;local v34=function() if (v3(v21.ConeOfCold) and IsPlayerSpell(v21.ColdestSnapTalent) and ((aura_env.PrevCast==v21.CometStorm) or v8(v21.CometStorm))) then local v50=0;while true do if (v50==(0 -0)) then v20("Cone of Cold");return true;end end end if (v3(v21.FrostfireBolt) and IsPlayerSpell(v21.DeathsChillTalent) and (v5("player",v21.IcyVeinsBuff)>(35 -26)) and ((v9(v21.DeathsChillBuff)<(1 + 8)) or ((v9(v21.DeathsChillBuff)==9) and  not ((aura_env.PrevCast==v21.FrostfireBolt) and ((GetTime() -aura_env.PrevCastTime)<0.15))))) then v20("Frostfire Bolt");return true;end if (v3(v21.IceNova) and (UnitLevel("target")>(0 + 0)) and  not v23.TargetIsFrozen and ((((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike)) and (v10(v21.WintersChillDebuff)==(1055 -(87 + 968))) and (v12(v21.WintersChillDebuff)==false)) or (((aura_env.PrevCast==v21.CometStorm) or v8(v21.CometStorm)) and v7(v21.ConeOfCold) and  not (aura_env.PrevCast2==v21.ConeOfCold))) and  not (aura_env.PrevCast==v21.Freeze)) then local v51=0 -0 ;while true do if (v51==0) then v20("Ice Nova");return true;end end end if (v3(v21.FrozenOrb) and  not ((aura_env.PrevCast==v21.ConeOfCold) or v8(v21.ConeOfCold))) then local v52=0 + 0 ;while true do if (v52==0) then v20("Frozen Orb");return true;end end end if (v3(v21.CometStorm) and ((v7(v21.ConeOfCold)>(13 -7)) or v3(v21.ConeOfCold))) then local v53=1413 -(447 + 966) ;while true do if (v53==0) then v20("Comet Storm");return true;end end end if (v3(v21.Flurry) and v3(v21.Flurry) and (v10(v21.WintersChillDebuff)==0) and ((v11(v21.ExcessFrostBuff) and (v7(v21.CometStorm)>(13 -8))) or (aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) then local v54=0;while true do if (v54==(1817 -(1703 + 114))) then v20("Flurry");return true;end end end if (v3(v21.Blizzard) and (IsPlayerSpell(v21.IceCallerTalent))) then v20("Blizzard");return true;end if (v3(v21.RayOfFrost) and IsPlayerSpell(v21.SplinteringRayTalent) and (v10(v21.WintersChillDebuff)==(703 -(376 + 325)))) then v20("Ray of Frost");return true;end if (v3(v21.ShiftingPower) and (v7(v21.IcyVeins)>(16 -6)) and ((v18(184 -124 ,v28) + 3 + 7)>v7(v21.IcyVeins))) then local v55=0 -0 ;while true do if (v55==0) then v20("Shifting Power");return true;end end end if (v3(v21.FrostfireBolt) and v11(v21.FrostfireEmpowermentBuff) and  not v11(v21.ExcessFrostBuff) and  not v11(v21.ExcessFireBuff)) then local v56=14 -(9 + 5) ;while true do if (v56==(376 -(85 + 291))) then v20("Frostfire Bolt");return true;end end end if (v3(v21.GlacialSpike) and ((v27<=(1271 -(243 + 1022))) or  not IsPlayerSpell(v21.IceCallerTalent)) and (v29==(19 -14))) then v20("Glacial Spike");return true;end if (v3(v21.IceLance) and (v11(v21.FingersOfFrostBuff) or (v10(v21.WintersChillDebuff)>(0 + 0)))) then v20("Ice Lance");return true;end if (v3(v21.Flurry) and v3(v21.Flurry) and (v10(v21.WintersChillDebuff)==(1180 -(1123 + 57)))) then local v57=0;while true do if (v57==0) then v20("Flurry");return true;end end end if v3(v21.FrostfireBolt) then local v58=0 + 0 ;while true do if (v58==(254 -(163 + 91))) then v20("Frostfire Bolt");return true;end end end if v33() then return true;end end;local v35=function() if (v3(v21.ConeOfCold) and IsPlayerSpell(v21.ColdestSnapTalent) and  not v3(v21.FrozenOrb) and ((aura_env.PrevCast==v21.CometStorm) or v8(v21.CometStorm) or (((aura_env.PrevCast==v21.FrozenOrb) or v8(v21.FrozenOrb)) and (v7(v21.CometStorm)>5))) and ( not IsPlayerSpell(v21.DeathsChillTalent) or (v5("player",v21.IcyVeinsBuff)<9) or (v9(v21.DeathsChillBuff)>=12))) then v20("Cone of Cold");return true;end if (v3(v21.Flurry) and v3(v21.Flurry) and (v10(v21.WintersChillDebuff)==0) and ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) then local v59=1930 -(1869 + 61) ;while true do if (v59==0) then v20("Flurry");return true;end end end if (v3(v21.IceNova) and (((v27<(2 + 3)) and (UnitLevel("target")>0) and  not v23.TargetIsFrozen and ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike)) and (v10(v21.WintersChillDebuff)==(0 -0)) and (v12(v21.WintersChillDebuff)==false)) or ((v27>=(7 -2)) and ((v2-aura_env.ConeOfColdLastUsed)<6) and ((v2-aura_env.ConeOfColdLastUsed)>((1 + 5) -max((1.5 -0)/(1 + 0 + ((1474.01 -(1329 + 145)) * UnitSpellHaste("player"))) ,0.75)))))) then v20("Ice Nova");return true;end if (v3(v21.FrozenOrb) and (v3(v21.FrozenOrb))) then local v60=971 -(140 + 831) ;while true do if (v60==(1850 -(1409 + 441))) then v20("Frozen Orb");return true;end end end if (v3(v21.Frostbolt) and IsPlayerSpell(v21.DeathsChillTalent) and (v5("player",v21.IcyVeinsBuff)>9) and ((v9(v21.DeathsChillBuff)<9) or ((v9(v21.DeathsChillBuff)==(727 -(15 + 703))) and  not ((aura_env.PrevCast==v21.Frostbolt) and ((GetTime() -aura_env.PrevCastTime)<(0.15 + 0)))))) then v20("Frostbolt");return true;end if v3(v21.CometStorm) then local v61=438 -(262 + 176) ;while true do if (v61==(1721 -(345 + 1376))) then v20("Comet Storm");return true;end end end if (v3(v21.RayOfFrost) and IsPlayerSpell(v21.SplinteringRayTalent) and ((aura_env.PrevCast==v21.Flurry) or v8(v21.Flurry))) then v20("Ray of Frost");return true;end if (v3(v21.Blizzard) and (IsPlayerSpell(v21.IceCallerTalent) or IsPlayerSpell(v21.FreezingRainTalent) or (v27>=(693 -(198 + 490))))) then local v62=0 -0 ;while true do if (v62==0) then v20("Blizzard");return true;end end end if (v3(v21.ShiftingPower) and (v7(v21.IcyVeins)>(23 -13)) and ((v18(1266 -(696 + 510) ,v28) + (20 -10))>v7(v21.IcyVeins))) then v20("Shifting Power");return true;end if (v3(v21.GlacialSpike) and (v29==(1267 -(1091 + 171))) and (v3(v21.Flurry) or (v10(v21.WintersChillDebuff)>(0 + 0)) or ((v27<5) and (UnitLevel("target")>(0 -0)) and  not v23.TargetIsFrozen and v3(v21.IceNova) and  not v11(v21.FingersOfFrostBuff)))) then v20("Glacial Spike");return true;end if (v3(v21.IceLance) and ((v11(v21.FingersOfFrostBuff) and  not ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) or (v10(v21.WintersChillDebuff)>0))) then local v63=0 -0 ;while true do if (v63==(374 -(123 + 251))) then v20("Ice Lance");return true;end end end if (v3(v21.Flurry) and v3(v21.Flurry) and (v10(v21.WintersChillDebuff)==0)) then v20("Flurry");return true;end if v3(v21.Frostbolt) then v20("Frostbolt");return true;end if v33() then return true;end end;local v36=function() if (v3(v21.CometStorm) and ((aura_env.PrevCast==v21.Flurry) or v8(v21.Flurry))) then v20("Comet Storm");return true;end if (v3(v21.FrostfireBolt) and IsPlayerSpell(v21.DeathsChillTalent) and (v5("player",v21.IcyVeinsBuff)>(44 -35)) and ((v9(v21.DeathsChillBuff)<(704 -(208 + 490))) or ((v9(v21.DeathsChillBuff)==(1 + 5)) and  not ((aura_env.PrevCast==v21.FrostfireBolt) and ((GetTime() -aura_env.PrevCastTime)<0.15))))) then local v64=0 + 0 ;while true do if (v64==0) then v20("Frostfire Bolt");return true;end end end if (v3(v21.IceNova) and (UnitLevel("target")>(836 -(660 + 176))) and  not v23.TargetIsFrozen and ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike)) and (v10(v21.WintersChillDebuff)==0) and (v12(v21.WintersChillDebuff)==false) and  not (aura_env.PrevCast==v21.Freeze)) then local v65=0;while true do if (v65==(0 + 0)) then v20("Ice Nova");return true;end end end if (v3(v21.Flurry) and v3(v21.Flurry) and (v10(v21.WintersChillDebuff)==(202 -(14 + 188))) and (v12(v21.WintersChillDebuff)==false) and ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike) or (v29>=(678 -(534 + 141)))) and  not (aura_env.PrevCast==v21.Freeze)) then v20("Flurry");return true;end if (v3(v21.Flurry) and v3(v21.Flurry) and ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike)) and  not (aura_env.PrevCast==v21.Freeze)) then local v66=0 + 0 ;while true do if (v66==0) then v20("Flurry");return true;end end end if (v3(v21.GlacialSpike) and (v29==(5 + 0))) then local v67=0;while true do if (v67==(0 + 0)) then v20("Glacial Spike");return true;end end end if (v3(v21.RayOfFrost) and (v10(v21.WintersChillDebuff)>(0 -0))) then local v68=0 -0 ;while true do if (v68==0) then v20("Ray of Frost");return true;end end end if (v3(v21.FrostfireBolt) and v11(v21.FrostfireEmpowermentBuff) and  not v11(v21.ExcessFrostBuff) and  not v11(v21.ExcessFireBuff)) then local v69=0;while true do if (v69==0) then v20("Frostfire Bolt");return true;end end end if (v3(v21.FrozenOrb) and  not v11(v21.FingersOfFrostBuff)) then v20("Frozen Orb");return true;end if (v3(v21.ShiftingPower) and (v7(v21.IcyVeins)>(28 -18)) and (v7(v21.FrozenOrb)>(6 + 4)) and ( not IsPlayerSpell(v21.CometStormTalent) or (v7(v21.CometStorm)>(7 + 3))) and ( not IsPlayerSpell(v21.RayOfFrostTalent) or (v7(v21.RayOfFrost)>10)) and ((v18(456 -(115 + 281) ,v28) + (23 -13))>v7(v21.IcyVeins))) then local v70=0;while true do if (v70==0) then v20("Shifting Power");return true;end end end if (v3(v21.IceLance) and ((v11(v21.FingersOfFrostBuff) and  not ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) or ((v10(v21.WintersChillDebuff)>0) and  not v23.Boltspam))) then local v71=0 + 0 ;while true do if (v71==0) then v20("Ice Lance");return true;end end end if v3(v21.FrostfireBolt) then v20("Frostfire Bolt");return true;end if v33() then return true;end end;local v37=function() if (v3(v21.CometStorm) and ((aura_env.PrevCast==v21.Flurry) or v8(v21.Flurry)) and (v11(v21.IcyVeinsBuff)==false)) then local v72=0 -0 ;while true do if (v72==(0 -0)) then v20("Comet Storm");return true;end end end if (v3(v21.Flurry) and v3(v21.Flurry) and (v10(v21.WintersChillDebuff)==(867 -(550 + 317))) and (v12(v21.WintersChillDebuff)==false) and ((aura_env.PrevCast==v21.Frostbolt) or v8(v21.Frostbolt) or (aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) then local v73=0 -0 ;while true do if (v73==(0 -0)) then v20("Flurry");return true;end end end if (v3(v21.Flurry) and v3(v21.Flurry) and ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) then v20("Flurry");return true;end if (v3(v21.IceNova) and (UnitLevel("target")>(0 -0)) and  not v23.TargetIsFrozen and  not (aura_env.PrevCast==v21.Freeze) and ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike)) and (v10(v21.WintersChillDebuff)==(285 -(134 + 151))) and (v12(v21.WintersChillDebuff)==false)) then v20("Ice Nova");return true;end if (v3(v21.FrozenOrb) and v3(v21.FrozenOrb) and ((v7(v21.IcyVeins)>(1687 -(970 + 695))) or v11(v21.IcyVeinsBuff))) then local v74=0 -0 ;while true do if (v74==(1990 -(582 + 1408))) then v20("Frozen Orb");return true;end end end if (v3(v21.ShiftingPower) and (v7(v21.IcyVeins)>10) and  not v3(v21.Flurry) and ((v11(v21.IcyVeinsBuff)==false) or (v5("player",v21.IcyVeinsBuff)>10)) and ((v18(208 -148 ,v28) + (12 -2))>v7(v21.IcyVeins))) then local v75=0;while true do if (v75==(0 -0)) then v20("Shifting Power");return true;end end end if (v3(v21.GlacialSpike) and (v29==5) and (v3(v21.Flurry) or (v10(v21.WintersChillDebuff)>0) or ((UnitLevel("target")>0) and  not v23.TargetIsFrozen and v3(v21.IceNova) and  not v11(v21.FingersOfFrostBuff)))) then v20("Glacial Spike");return true;end if (v3(v21.RayOfFrost) and (v10(v21.WintersChillDebuff)>0) and (v11(v21.IcyVeinsBuff)==false)) then v20("Ray of Frost");return true;end if (v3(v21.Frostbolt) and IsPlayerSpell(v21.DeathsChillTalent) and (v5("player",v21.IcyVeinsBuff)>(1833 -(1195 + 629))) and ((v9(v21.DeathsChillBuff)<(8 + ((5 -1) * ((IsPlayerSpell(v21.SlickIceTalent) and (242 -(187 + 54))) or (780 -(162 + 618)))))) or ((v9(v21.DeathsChillBuff)==(6 + 2 + (4 * ((IsPlayerSpell(v21.SlickIceTalent) and (1 + 0)) or (0 -0))))) and  not ((aura_env.PrevCast==v21.Frostbolt) and ((GetTime() -aura_env.PrevCastTime)<(0.15 -0)))))) then local v76=0 + 0 ;while true do if ((1636 -(1373 + 263))==v76) then v20("Frostbolt");return true;end end end if (v3(v21.IceLance) and ((v11(v21.FingersOfFrostBuff) and  not ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) or ( not v23.Boltspam and (v10(v21.WintersChillDebuff)>(1000 -(451 + 549)))))) then v20("Ice Lance");return true;end if v3(v21.Frostbolt) then local v77=0 + 0 ;while true do if (0==v77) then v20("Frostbolt");return true;end end end if v33() then return true;end end;local v38=function() local v43=0 -0 ;while true do if (v43==(2 -0)) then if (v3(v21.IceLance) and  not v23.Boltspam and ((v11(v21.FingersOfFrostBuff) and  not ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) or (v10(v21.WintersChillDebuff)>(1384 -(746 + 638))))) then local v79=0 + 0 ;while true do if (v79==(0 -0)) then v20("Ice Lance");return true;end end end if v3(v21.FrostfireBolt) then v20("Frostfire Bolt");return true;end if v33() then return true;end break;end if ((341 -(218 + 123))==v43) then if (v3(v21.CometStorm) and ((aura_env.PrevCast==v21.Flurry) or v8(v21.Flurry))) then v20("Comet Storm");return true;end if (v3(v21.Flurry) and v23.Boltspam and v3(v21.Flurry) and (v29<(1586 -(1535 + 46))) and (v10(v21.WintersChillDebuff)==(0 + 0))) then local v80=0 + 0 ;while true do if (v80==(560 -(306 + 254))) then v20("Flurry");return true;end end end if (v3(v21.Flurry) and  not v23.Boltspam and v3(v21.Flurry) and (v29<(1 + 4)) and (v10(v21.WintersChillDebuff)==(0 -0)) and (v12(v21.WintersChillDebuff)==false) and ((aura_env.PrevCast==v21.FrostfireBolt) or v8(v21.FrostfireBolt) or (aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) then v20("Flurry");return true;end if (v3(v21.IceLance) and v23.Boltspam and v11(v21.ExcessFireBuff) and  not v11(v21.BrainFreezeBuff)) then v20("Ice Lance");return true;end v43=1468 -(899 + 568) ;end if (v43==(1 + 0)) then if (v3(v21.GlacialSpike) and (v29==(12 -7))) then local v81=603 -(268 + 335) ;while true do if (v81==0) then v20("Glacial Spike");return true;end end end if (v3(v21.RayOfFrost) and (v10(v21.WintersChillDebuff)>(290 -(60 + 230))) and ( not v23.Boltspam or (v5("player",v21.IcyVeinsBuff)<(587 -(426 + 146))))) then local v82=0 + 0 ;while true do if (0==v82) then v20("Ray of Frost");return true;end end end if (v3(v21.FrozenOrb) and ((v23.Boltspam and (v11(v21.IcyVeinsBuff)==false)) or ( not v23.Boltspam and  not v11(v21.FingersOfFrostBuff)))) then v20("Frozen Orb");return true;end if (v3(v21.ShiftingPower) and ((v11(v21.IcyVeinsBuff)==false) or  not v23.Boltspam) and (v7(v21.IcyVeins)>(1466 -(282 + 1174))) and (v7(v21.FrozenOrb)>10) and ( not IsPlayerSpell(v21.CometStormTalent) or (v7(v21.CometStorm)>(821 -(569 + 242)))) and ( not IsPlayerSpell(v21.RayOfFrostTalent) or (v7(v21.RayOfFrost)>(28 -18))) and ((v18(4 + 56 ,v28) + (1034 -(706 + 318)))>v7(v21.IcyVeins))) then v20("Shifting Power");return true;end v43=1253 -(721 + 530) ;end end end;local v39=function() local v44=1271 -(945 + 326) ;while true do if (v44==(7 -4)) then if (v3(v21.IceLance) and  not v23.Boltspam and ((v11(v21.FingersOfFrostBuff) and  not ((aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) or (v10(v21.WintersChillDebuff)>0))) then local v83=0 + 0 ;while true do if (v83==(700 -(271 + 429))) then v20("Ice Lance");return true;end end end if v3(v21.Frostbolt) then v20("Frostbolt");return true;end if v33() then return true;end break;end if (0==v44) then if (v3(v21.CometStorm) and ((aura_env.PrevCast==v21.Flurry) or v8(v21.Flurry)) and (v11(v21.IcyVeinsBuff)==false)) then local v84=0;while true do if (v84==(0 + 0)) then v20("Comet Storm");return true;end end end if (v3(v21.Flurry) and v3(v21.Flurry) and (v10(v21.WintersChillDebuff)==0) and (v12(v21.WintersChillDebuff)==false) and ((aura_env.PrevCast==v21.Frostbolt) or v8(v21.Frostbolt) or (aura_env.PrevCast==v21.GlacialSpike) or v8(v21.GlacialSpike))) then local v85=0;while true do if (v85==0) then v20("Flurry");return true;end end end if (v3(v21.FrozenOrb) and v3(v21.FrozenOrb) and ((v7(v21.IcyVeins)>22) or v11(v21.IcyVeinsBuff))) then v20("Frozen Orb");return true;end v44=1;end if (v44==(1501 -(1408 + 92))) then if (v3(v21.GlacialSpike) and (v29==(1091 -(461 + 625))) and (v3(v21.Flurry) or (v10(v21.WintersChillDebuff)>(1288 -(993 + 295))) or ((v7(v21.Flurry)<max(C_Spell.GetSpellInfo(v21.GlacialSpike).castTime/1000 ,WeakAuras.gcdDuration())) and (v7(v21.Flurry)>0)))) then v20("Glacial Spike");return true;end if (v3(v21.RayOfFrost) and v23.Boltspam and (v10(v21.WintersChillDebuff)>(0 + 0)) and (v11(v21.IcyVeinsBuff)==false)) then v20("Ray of Frost");return true;end if (v3(v21.RayOfFrost) and  not v23.Boltspam and (v10(v21.WintersChillDebuff)==1)) then v20("Ray of Frost");return true;end v44=1173 -(418 + 753) ;end if (v44==2) then if (v3(v21.ShiftingPower) and (v7(v21.IcyVeins)>(4 + 6)) and  not v3(v21.Flurry) and (v23.Boltspam or (v11(v21.IcyVeinsBuff)==false) or (v5("player",v21.IcyVeinsBuff)>(2 + 8))) and ((v18(60,v28) + 10)>v7(v21.IcyVeins))) then local v86=0;while true do if (v86==0) then v20("Shifting Power");return true;end end end if (v3(v21.Frostbolt) and v23.Boltspam and (v5("player",v21.IcyVeinsBuff)>(3 + 6)) and (v9(v21.DeathsChillBuff)<(3 + 5))) then v20("Frostbolt");return true;end if (v3(v21.IceLance) and v23.Boltspam and ((v10(v21.WintersChillDebuff)==2) or ((v10(v21.WintersChillDebuff)>(529 -(406 + 123))) and v3(v21.Flurry)))) then v20("Ice Lance");return true;end v44=1772 -(1749 + 20) ;end end end;if (IsPlayerSpell(v21.FrostfireBoltTalent) and (v27>=3)) then local v46=0 + 0 ;while true do if (v46==0) then v34();return true;end end end if (v27>=(1325 -(1249 + 73))) then v35();return true;end if (IsPlayerSpell(v21.FrostfireBoltTalent) and (v27==2)) then local v47=0 + 0 ;while true do if (v47==(1145 -(466 + 679))) then v36();return true;end end end if (v27==(4 -2)) then v37();return true;end if IsPlayerSpell(v21.FrostfireBoltTalent) then local v48=0 -0 ;while true do if (v48==(1900 -(106 + 1794))) then v38();return true;end end else local v49=0;while true do if (v49==0) then v39();return true;end end end v20("Clear");end;