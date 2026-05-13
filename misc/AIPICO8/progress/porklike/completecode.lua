-- porklike: wurst comes to worst
-- by krystian majewski, lazy devs

function _init()
 cartdata("porklike")
 ver="v3"
 t,tani,buttbuff,fadetable,dirx,diry,dirpos,invdir,mob_ani,mob_type,mob_hp,mob_brain,brain_w,brain_a,mob_aspd,mob_plan,pick_name,pick_desc2d,crv_sig,crv_msk,dor_sig,dor_msk,free_sig,free_msk,wall_sig,wall_msk,tleaniadd,tleanisub,boomspr,spinspr,dirtle,voitle=0,0,0,explode2d("0,0,0,0,0,0,0,0,0,0,0,0,0,0,0|1,1,129,129,129,129,129,129,129,129,0,0,0,0,0|2,2,2,130,130,130,130,130,128,128,128,128,128,0,0|3,3,3,131,131,131,131,129,129,129,129,129,0,0,0|4,4,132,132,132,132,132,132,130,128,128,128,128,0,0|5,5,133,133,133,133,130,130,128,128,128,128,128,0,0|6,6,134,13,13,13,141,5,5,5,133,130,128,128,0|7,6,6,6,134,134,134,134,5,5,5,133,130,128,0|8,8,136,136,136,136,132,132,132,130,128,128,128,128,0|9,9,9,4,4,4,4,132,132,132,128,128,128,128,0|10,10,138,138,138,4,4,4,132,132,133,128,128,128,0|11,139,139,139,139,3,3,3,3,129,129,129,0,0,0|12,12,12,140,140,140,140,131,131,131,1,129,129,129,0|13,13,141,141,5,5,5,133,133,130,129,129,128,128,0|14,14,14,134,134,141,141,2,2,133,130,130,128,128,0|15,143,143,134,134,134,134,5,5,5,133,133,128,128,0"),explodeval("-1,1,0,0,1,1,-1,-1"),explodeval("0,0,-1,1,-1,1,1,-1"),explodeval("-1,1,-18,18,-17,19,17,-19"),explodeval("2,1,4,3"),explode("164|165|166|167,128|129|128|130,134|135|136|137,138|139|138|140,131|132|131|133,141|142|143|142,144|145|146|147,187|188|189|190,151|152|153|152,154|154|154|154|154|154|154|154|154|154|154|154|155,156|156|156|157,158|158|158|159,160,161,162"),explode("pl,ai,ai,ai,ai,ai,ai,ai,we,ob,we,we,ob,ob,ob"),explodeval("5,1,1,1,2,1,1,10,1,1,1,1,1,1,1"),explodeval("1,2,4,2,2,2,5,6,3,1,1,1,1,1,1"),{ai_blank,ai_wait,ai_weed,ai_wait,ai_wait,ai_reaper},{ai_blank,ai_attac,ai_weed,ai_queen,ai_kong,ai_reaper},explodeval("1,2,2,2,1.8,1.5,2,1.5,1.5,3,1,1,1,1,1"),explode2d("2,2,2,2,2|2,2,3,2,2,3|2,2,3,2,2,3,2|4,4,4,5,4,4,4,5|4,4,5,4,4,5,4,4,5|5,4,5,4,4,5,4,4,5|6,6,6,7,6,6,6,7,6|6,6,7,6,6,7,6,6,7|6,7,6,7,6,7,6,7,6"),explode("jump,bolt,push,grapple,spear,smash,hook,spin,suplex,slap"),explode2d("jumps 2 spaces,stops enemies,you skip over|ranged attack,does 1 damage,and stops enemy|ranged attack,pushes enemy 1 space,and stops them|pulls yourself up to,the next occupied,space|hits 2 spaces in,any direction,|smashes a wall,or does 2 damage,|pulls an enemy,1 space towards you,and stops them|hits 4 spaces around,you,|lifts and throws,an enemy behind you,stops enemy|hits an enemy and,hops backwards,stops enemy",explode),explodeval("255,214,124,179,233"),explodeval("0,9,3,12,6"),explodeval("192,48"),explodeval("15,15"),explodeval("0,0,0,0,16,64,32,128,161,104,84,146"),explodeval("8,4,2,1,6,12,9,3,10,5,10,5"),explodeval("251,233,253,84,146,80,16,144,112,208,241,248,210,177,225,120,179,0,124,104,161,64,240,128,224,176,242,244,116,232,178,212,247,214,254,192,48,96,32,160,245,250,243,249,246,252"),explodeval("0,6,0,11,13,11,15,13,3,9,0,0,9,12,6,3,12,15,3,7,14,15,0,15,6,12,0,0,3,6,12,9,0,9,0,15,15,7,15,14,0,0,0,0,0,0"),explodeval("64,66,80"),explodeval("65,67,81"),explodeval("89,90,91,92"),explodeval("105,106,107,108"),explodeval("74,75,76"),explodeval("11,11,11,11,11,11,10")
 startgame()
end

function _update60()
 t+=1
 if buttbuff==0 then
  for i=1,6 do
   if btnp(i-1) then
    buttbuff=i
   end
  end
 end
 _upd()
 dohpwind()
end

function _draw()
 _drw()
 drawind()
 if logo_y>-24 then
  logo_t-=1
  if logo_t<=0 then
   logo_y+=logo_t/20
  end
  palt(11,true)
  palt(0,false)
  spr(210,7,logo_y,14,3)
  oprint8("wurst comes to worst",24,logo_y+20,7,0)  
  print(ver,5,154-logo_y,5)
 end
 if (floor==0 or _upd==update_inv) and chain>0 then
  print("wurstchain:"..chain,35,119,chainsafe and 6 or 5)
 end
 if fadeperc>0 then
  fadeperc=max(fadeperc-0.04,0)
  dofade()
 end
end

function startgame()
 poke(0x3101,194)
 music"0"
 fadeperc,chain,chainsafe,buttbuff,logo_t,logo_y,hpwind,win,winfloor,turn,key,_upd,_drw,tmap,😐,floats,wind,sprs,eqp,st_steps,st_kills=1,dget(0),true,0,240,35,nil,false,10,"ai",0,update_anis,draw_game,blankmap(1),addmob(1,20),{},{},{},{},0,0  
 genfloor(0)
end
-->8
--updates
function update_game()
 if buttbuff==0 then return end
 logo_t=min(logo_t,0)
 if buttbuff<5 then
  thrdir=buttbuff
  moveplayer(buttbuff)
 elseif buttbuff==6 then
  showinv()
  sfx"3"
 end
 buttbuff=0
end
function update_inv()
 if buttbuff==3 or buttbuff==4 then
  sfx "5"
  invwind.cur-=diry[buttbuff+1]
 end
 invwind.cur=(invwind.cur-1)%#invwind.txt+1
 sel=invwind.cur
 seleqp,buttbuff=eqp[sel],0
 updatedesc()
 if btnp"4" then
  sfx"2"
  _upd=update_game
  hideinv()
 elseif btnp"5" then
  if seleqp==nil then
   sfx"9"
  else
   _upd,drawarr,invwind.invert,invwind.col[sel]=update_targ,true,true,0
   if tmap[😐.pos+dirpos[thrdir]]<0 then
    thrdir=invdir[thrdir]
   end
   sfx"3"
   hideinv()
   local txt="  "..pick_name[seleqp.typ]
   local w=#txt*4+7
   usewind=addwind(64-w/2,hpwind.y,w,13,{txt})
   usewind.icn,hpwind.dur,hpwind={seleqp.typ},0,nil
  end
 end
end

function update_targ()
 usewind.y=hpwind.y
 if buttbuff>0 and buttbuff<5 then
  thrdir=buttbuff
  mobdir(😐,thrdir)
  sfx"5"
 end
 if btnp"4" then
  drawarr=false
  showinv()
  invwind.cur,usewind.dur,usewind=sel,0,nil
  sfx "2"
 elseif btnp"5" then
  sfx"3"
  eat()
  drawarr,usewind.dur,usewind=false,0,nil
 end
 buttbuff=0
end

function update_anis()
 local pass=#sprs==0
 for arr in all({mobs,picks}) do
	 for m in all(arr) do
	  if m.mov then
	   m.t,pass=min(m.t+m.dt,1),false
	   m:mov()
    checkend(m)
	  end  
	 end
 end  
 if pass then
  passturn()
 end
end

function passturn()
 if turn=="player" then
  if noturn then
   _upd,noturn=update_game,false
  else
   turn="ai"
   doai(false)
  end
 elseif turn=="ai" then
  turn="weeds"
  doai(true)
 elseif turn=="weeds" then
  if win or 😐.hp<=0 then  
   showgover()
   return
  end  
  if steps==100 and floor>0 then   
   steps+=1
   sfx "15"
   showmsg("wurstlord awakens")
   addmob(8,dropspot(spawnpos))
  end
  turn,_upd="player",update_game
  if 😐.recover>0 then
   😐.recover-=1
   if 😐.recover==0 then
    😐.sight=4
    unfog()
   end
  end
 end
end

function update_gover()
 if btnp "5" then
  sfx "3"
  fadeout()
  startgame()
 end
end
-->8
--draws
function draw_game() 
 cls"0"
 if fadeperc==1 then return end
 tani+=1
 if tani>=7 then
  tani=0
  for p=20,305 do
   local tle=tmap[p]
   if find(tleaniadd,tle) then
    tle+=1
   elseif find(tleanisub,tle) then
    tle-=1
   end
   tmap[p]=tle
  end
 end
 for x=0,15 do
  for y=0,15 do
   local pos=xytopos(x+1,y+1)
   if fog[pos]==0 then
    spr(tmap[pos],x*8,y*8)
   end
  end
 end
 for p in all(picks) do
  if fog[p.pos]==0 then
	  local x,y=postoscreen(p.pos)
   myspr(getframe(p.ani,4),x+p.ox,y+p.oy)
	  if p.hop then
	   --t/24*4)/8
	   y=y-sin(t/48-0.1)
	   spr(p.typ+114,x+p.ox+0.5,y+p.oy+0.5)
 	 end
  end
 end
 for m in all(dmobs) do
  drawmob(m)
  m.dur-=1
  if m.dur<=0 then
   del(dmobs,m)
  end
 end
 for i=#mobs,1,-1 do
  drawmob(mobs[i])
 end
 for s in all(sprs) do
  s.t=s.t+1
  if s.t>=s.maxt then
   del(sprs,s)
   if s.trg_mob then
    s.trg_func(s.trg_mob,s.trg_val,s.trg_val2)
   end
  elseif s.t>=0 then
   if s.dx then
    s.x+=s.dx
    s.y+=s.dy
    if s.drag then
     s.dx*=s.drag
     s.dy*=s.drag
    end
   end
   myspr(s.ani[flr(#s.ani*s.t/s.maxt)+1],s.x,s.y,s.flx,s.fly)
  end
 end
 for f in all(floats) do
  oprint8(f.txt,f.x,max(f.y,0),f.c==8 and getframe({8,14,7},4) or f.c,0)
  f.y+=(f.ty-f.y)/10
  f.t+=1
  if f.t>70 then
   del(floats,f)
  end
 end
 if drawarr then
  if seleqp.typ==8 then
   for i=1,4 do
    drawarrow(i)
   end
  else
   drawarrow(thrdir)
  end
 end
end

function drawarrow(dr)
 local x,y=postoscreen(😐.pos+dirpos[dr])
 myspr(dr+170,
        x+sin(t/15)*dirx[dr]+dirx[dr],
        y+sin(t/15)*diry[dr]+diry[dr])
end

function drawmob(m)
 if fog[m.pos]!=0 or m.vis==false then return end
 if m.flash>0 then
  m.flash-=1
  pal(10,7)
 end
 if m.haskey and sin(t/24)>0.8 then
  pal(10,7)
 end
 local x,y=postoscreen(m.pos)
 myspr(getframe(m.ani,m.aspd),x+m.ox,y+m.oy,m.flp)
end

function myspr(sp,x,y,flp,flpy)
 palt(11,true)
 palt(0,false)
 spr(sp,x+0.5,y+0.5,1,1,flp,flpy)
 pal()  
end

function draw_gover()
 cls()
 if win then
  print("the kielbasa is yours",23,47,10)
  spr(77,51,15,3,3)
 else
  print("you died",48,47,6) 
  spr(168,51,15,3,3)
 end
 print("press ❎",48,100,getframe({5,6,7},1.5))
end

-->8
--tools
function getframe(ani,spd)
 return ani[flr(t/24*spd)%#ani+1]
end

function find(arr,val)
 if val==nil then return false end
 for v in all(arr) do
  if v==val then return true end
 end
 return false
end

function oprint8(_t,_x,_y,_c,_c2)
 for i=1,8 do
  print(_t,_x+dirx[i],_y+diry[i],_c2)
 end 
 print(_t,_x,_y,_c)
end

function dist(pos1,pos2)
 local fx,fy=postoxy(pos1)
 local tx,ty=postoxy(pos2)
 local dx,dy=fx-tx,fy-ty
 return sqrt(dx*dx+dy*dy)
end

function mysgn(x)
 return x>0 and 1 or x<0 and -1 or 0
end

function los(pos1,pos2,retest)
 if dist(pos1,pos2)==1 then return true end
 local x1,y1=postoxy(pos1)
 local x2,y2=postoxy(pos2)
 local dx,dy,sx,sy=abs(x2-x1),abs(y2-y1),sgn(x2-x1),sgn(y2-y1) 
 local err,e2,frst=dx-dy,true
 while not(x1==x2 and y1==y2) do
  if not frst and isw(xytopos(x1,y1),"sight")==false then
   if retest then
    return false
   end
   return los(pos2,pos1,true)
  end
  e2,frst=err+err,false
  if e2>-dy then
   err-=dy
   x1+=sx
  end
  if e2<dx then 
   err+=dx
   y1+=sy
  end
 end
 return true 
end

function dofade()
 fadeperc=min(fadeperc,1)
 for c=0,15 do
  pal(c,fadetable[c+1][flr(fadeperc*16+1)],1)
 end
end

function wait(_wait)
 repeat
  _wait-=1
  flip()
 until _wait<0
end

function fadeout(spd,_wait)
 local spd,_wait=spd or 0.04,_wait or 0
 repeat
  fadeperc=min(fadeperc+spd,1)
  dofade()
  flip()
 until fadeperc==1
 wait(_wait)
end

function blankmap(_dflt)
 --offmap is -1
 local ret,_dflt={},_dflt or 0
 
 for x=0,17 do
  for y=0,17 do
   ret[xytopos(x,y)] = (x==0 or x==17 or y==0 or y==17) and -1 or _dflt
  end
 end
 return ret
end

function postoxy(pos)
 return (pos-1)%18,flr((pos-1)/18)
end

function postoscreen(pos)
 local x,y=postoxy(pos)
 return (x-1)*8,(y-1)*8
end

function xytopos(x,y)
 return 1+x+y*18
end

function getrnd(arr)
 return arr[1+flr(rnd(#arr))]
end

function copymap(x,y)
 for _x=0,15 do
  for _y=0,15 do
   local tle,pos=mget(_x+x,_y+y),xytopos(_x+1,_y+1)
   if tle==15 or tle==182 then
    😐.pos,spawnpos=pos,pos
   elseif tle==14 then
    epos=pos
   elseif tle==63 then
    tle,gpos=14,pos
   elseif tle==68 then
    tle,♥pos=72,pos
   end
   tmap[pos]=tle
  end
 end
end

function explode(s,sep)
 local sep,retval,lastpos=sep or ",",{},1
 for i=1,#s do
  if sub(s,i,i)==sep then
   add(retval,sub(s, lastpos, i-1))
   i+=1
   lastpos=i
  end
 end
 add(retval,sub(s,lastpos,#s))
 return retval
end

function explode2d(s,func)
 local arr,func=explode(s,"|"),func or explodeval
 for i=1,#arr do
  arr[i] = func(arr[i])
 end
 return arr
end

function explodeval(_arr,sep)
 return toval(explode(_arr,sep))
end

function toval(_arr)
 local _retarr={}
 for _i in all(_arr) do
  add(_retarr,flr(tonum(_i)))
 end
 return _retarr
end

function calcdist(tpos,mode)
 local mode,cand,step,candnew=mode or "test",{},0
 distmap=blankmap(-2)
 --8140
 if mode=="dist" then
  for p=20,305 do
   distmap[p]=dist(tpos,p)
  end
  return
 end
 add(cand,tpos)
 distmap[tpos]=0
 repeat
  step+=1
  candnew={} 
  for c in all(cand) do
   for d=1,4 do
    local npos=c+dirpos[d]
    if distmap[npos]==-2 then
     distmap[npos]=step
     if isw(npos,mode) then
      add(candnew,npos)
     end
    end
   end
  end
  cand=candnew
 until #cand==0
end
-->8
--gameplay
function moveplayer(dr)
 local destpos=😐.pos+dirpos[dr]
 if isw(destpos,"checkmobs") then
  mobwalk(😐,dr)
  😐.trig=true
  sfx "12"
  st_steps+=1
  steps+=1
 else
  local mb,spd=getmob(destpos),nil
  if mb then 
   hitmob(mb,1)
   if mb.typ==4 and rnd(2)<1 then
    blind(😐)
   end
  elseif fget(tmap[destpos],1) then
   if bumptile(destpos) then
    sfx"19"
   else
    spd,noturn=3,true
   end
  else
   spd,noturn=3,true
  end
  mobbump(😐,dr,spd)
  😐.trig=spd==nil
 end
 _upd=update_anis
end

function bumptile(pos)
 local tle=tmap[pos]
 if tle==97 or tle==99 then
  tmap[pos]+=1
 elseif tle==82 or tle==114 then
  tmap[pos]=115
  resetneighs(pos)
 elseif tle==63 then
  if key<1 then
   showmsg("one monster holds the key")
   sfx "3"
   return false
  else 
   key-=1
   tmap[pos]=1
  end
 end
 return true 
end

function trig_step(mob,skip7)
 local pos=mob.pos
 local tle=tmap[pos]
  
 if mob==😐 then
  unfog()
  if tle==14 then
   sfx "4"
   fadeout()
   😐.recover=1
   genfloor(floor+1)
   poke(0x5f95,floor)
   return
  elseif tle==110 then
   win=true
   return
  end
  
  local p=getpick(pos)
  if p then
   pickup(p)
  end
  
  local vpos=voidmap[pos]
  if vpos>0 then
   local pos2=voids[vpos].exit
   if pos2 and fget(tmap[pos2],6) then
    tmap[pos2]+=65
   end
  end
 end
 if tle==81 or tle==80 then
  hitmob(mob,3)
  if mob.hp<=0 and mob.ai then   
   droppick_rnd(mob.pos)
  end
  tmap[pos]=176
 elseif tle==7 and pos!=mob.last7 then
  teleport(mob)
  mob.last7=mob.pos
  trig_step(mob)
 end
 
 if tle!=7 then
  mob.last7=-1
 end
end

function getmob(pos)
 for m in all(mobs) do
  if m.pos==pos then
   return m
  end
 end
 return false
end

function noneighs(pos)
 for i=1,4 do
  if getmob(pos+dirpos[i]) then
   return false
  end
 end
 return true
end

function pickup(pick)
 local s=10
 pick.typ-=1
 local i,typ,fre,flt=0,pick.typ
 if typ==-1 then
  😐.hp+=1
  flt,s="+1",20
 elseif typ==0 then
  key+=1
  flt="key"
 else
	 flt=pick_name[typ]
	 for i=1,4 do
	  local e=eqp[i]
	  if fre==nil and e==nil then
	   fre=i
	  elseif e and e.typ==typ then
				e.chrg+=pick.chrg
				typ=99 
	  end
	 end
	 if typ!=99 then
 	 if fre then
    eqp[fre]=pick
 	 else
	   addfloat("full!",😐.pos,9)
	   pick.typ+=1
	   sfx "9"
	   return 
 	 end
  end
	end
 del(picks,pick)
 addfloat(flt,😐.pos,7)
 sfx(s)
end

function getpick(pos)
 for p in all(picks) do
  if p.pos==pos then
   return p
  end
 end
 return false
end

function isw(pos,mode)
 local mode,tle = mode or "test",tmap[pos] or -1

 if mode=="sight" then
  return not fget(tle,2)
 else
  if tle>0 and not fget(tle,0) then
   if mode=="checkmobs" then
    return not getmob(pos)
   elseif mode=="smart" then
    return not fget(tle,1)
   elseif mode=="smartmob" or mode=="ai" then
    if not fget(tle,1) then
     local m=getmob(pos)
     if m and mode=="ai" then
      return m.active==true
     end
     return not m
    end
    return false
   end
   return true
  end
 end
 return false
end

function hitpos(pos,dmg,stun)
 hitmob(getmob(pos),dmg,stun)
 local tle=tmap[pos]
 if tle==nil then
  return
 elseif tle==80 or tle==81 then
  tle=176
  sfx "18"
 elseif tle>176 and fget(tle,3) then
  tle=getrnd(dirtle)
  resetneighs(pos)
  sfx "18"
 end
 tmap[pos]=tle
 unfog()
end

function hitmob(mob,dmg,stun)
 if not mob then return end
 if mob.ob then
  openob(mob)
  return
 end
 mob.hp-=dmg
 mob.flash,mob.stun=10,mob.stun or stun==true
 addfloat("-"..dmg,mob.pos,mob==😐 and 8 or 9)
 
 sfx(mob==😐 and 6 or 7)
 mob.vis=true
 
 if mob.hp<=0 then
  del(mobs,mob)
  add(dmobs,mob)
  mob.dur,mob.mov=7,nil

  if mob.haskey then
   droppick(1,mob.pos)
  end
  if mob.typ==8 then
   😐.hp=max(😐.hp,5)
   sfx"20"
   droppick(1,mob.pos)
   poke(0x5f96,1)
  end
  if mob.ai then
   st_kills+=1
  end
 end
end

function openob(ob)
 local sx,perc,tle,slime,pos=8,20,dirt(ob.pos),true,ob.pos
 del(mobs,ob)
 if ob.typ==15 then
  sx,perc,tle,slime=19,100,9,false
  if floor==0 then
   chainsafe=false
   dset(0,0)
  end
 elseif ob.typ==10 then
  sx,perc,tle,slime=14,100,73,false
  boom(pos)
 end
 
 sfx(sx)
 if not fget(tmap[pos],1) then
  tmap[pos]=tle
 end
 if rnd(100)<perc then
  if slime and rnd(5)<1 then
   sfx"9"
   local p=dropspot(pos)
   mobhop(addmob(2,pos),p)
  elseif ob.♥ and rnd(5)<1 then
   droppick(0,pos)
  else
   droppick_rnd(pos)
  end
 end
end

function boom(pos)
 for i=1,8 do
  local p=pos+dirpos[i]
  hitpos(p,1)
  local tle=tmap[p]
  if fget(tle,5) then
   tle=5
  elseif isw(p) and not fget(tle,1) then
   tle=getrnd(dirtle)
  end
  tmap[p]=tle
 end
 local boomx,boomy=postoscreen(pos)
 for i=0,20 do
  local ang,dist,spd=rnd(),rnd(5),0.5+rnd(0.5)
  add(sprs,{
   ani=boomspr,
   t=0,
   maxt=10+rnd(35),
   x=boomx+sin(ang)*dist,
   y=boomy+cos(ang)*dist,
   dx=sin(ang)*spd,
   dy=cos(ang)*spd,
   drag=0.9
  })
 end
end

function sight(mb,pos)
 return dist(mb.pos,pos)<=mb.sight 
  and los(mb.pos,pos)
end

function unfog()
 for p=20,305 do
  if fog[p]==1 and dist(😐.pos,p)<=😐.sight and los(😐.pos,p) then
   unfogtile(p)
  end
 end
end

function unfogtile(pos)
 fog[pos]=0
 if isw(pos,"sight") then
  for i=1,4 do
   local npos=pos+dirpos[i]
   if not isw(npos) then
    fog[npos]=0
   end
  end  
 end
end

function showgover()
 if win then
  music"24"
  chain+=1
  dset(0,chain)
  poke(0x5f97,chain)
 else
  music"22"
 end
 wait(70)
 fadeout(0.02)
 _upd,_drw,wind=update_gover,draw_gover,{}
 
 local wnd=addwind(40,60,53,31,{
 "floor: "..floor,
 "steps: "..st_steps,
 "kills: "..st_kills
 })
 wnd.noborder,wnd.col=true,{5,5,5}
end

function eat()
 local abl,pos,tdir=seleqp.typ,😐.pos,dirpos[thrdir]
 local pos1,pos2,posb,hit,land=pos+tdir,pos+tdir*2,pos-tdir,throwtile(pos,thrdir)
 local mob1,mob2,mobh=getmob(pos1),getmob(pos2),getmob(hit)
 
 if abl==1 then
  if isw(pos2,"checkmobs") then
   if mob1 then
    mob1.stun=true
   end
   mobhop(😐,pos2)
   sfx"11"
  else
   sfx"21"
  end
 elseif abl==2 then
  sfx"11"
  local sp=shoot(pos,hit)
		sp.trg_func,sp.trg_mob,sp.trg_val,sp.trg_val2=hitpos,hit,1,true
 elseif abl==3 then
  sfx"11"
  local sp=shoot(pos,hit)
  sp.trg_val,sp.trg_func,sp.trg_mob=thrdir,mobpush,mobh
 elseif abl==4 then
  local sp=rope(pos,land)
  sp.trg_val,sp.trg_func,sp.trg_mob=land,mobhop,😐
  sfx"11"
 elseif abl==5 then
  rope(pos,pos2)
  sfx"17"
  hitpos(pos1,1)
  hitpos(pos2,1)
  mobbump(😐,thrdir)
 elseif abl==6 then
  mobbump(😐,thrdir)
  hitpos(pos1,2)
  if fget(tmap[pos1],7) then
   tmap[pos1]=getrnd(dirtle)
   resetneighs(pos1)
   sfx"18"
  end
 elseif abl==7 then
  local sp=rope(pos,hit)
  sfx"11"
  sp.trg_func,sp.trg_mob,sp.trg_val=mobpush,mobh,invdir[thrdir]
 elseif abl==8 then
  sfx"16"
  for i=1,4 do
   local posx,posy=postoscreen(pos)
   add(sprs,{
    ani=spinspr,
    t=i*-4,
    maxt=7,
    x=posx,
    y=posy,
    dx=dirx[i]*2,
    dy=diry[i]*2,
    drag=0.9,
    trg_func=hitpos,
    trg_mob=pos+dirpos[i],
    trg_val=1
   })
  end
  mobhop(😐,pos) 
 elseif abl==9 then
  if mob1 and isw(posb,"checkmobs") then
   mobhop(mob1,posb)
   sfx"11"
   mob1.stun,mob1.trig=true,true
   mobbump(😐,thrdir)
  else
   sfx"21"
  end
 elseif abl==10 then
  if isw(posb,"checkmobs") then
   mobhop(😐,posb)
   sfx"11"
  else
   mobbump(😐,invdir[thrdir])
  end
  hitpos(pos1,1,true)
 end
 eqp[sel].chrg-=1
 if eqp[sel].chrg<=0 then
  eqp[sel]=nil
 end
 _upd=update_anis
 😐.trig=true
 unfog()
end

function throwtile(pos,dr)
 local d=dirpos[dr]
 repeat
  pos+=d
 until not isw(pos,"checkmobs")
 return pos,pos-d 
end

function mobpush(mb,dr)
 if mb then
	 if isw(mb.pos+dirpos[dr],"checkmobs") then
	  mobwalk(mb,dr)
	  mb.trig=true
	 else
	  mobbump(mb,dr)
	 end
	 mb.stun,mb.vis=true,true
	 sfx"13"
 end
end

function resetneighs(pos)
 local tle=tmap[pos+18]
 if tle then
  if tle==4 or tle==180 then
   tle=1
  elseif tle==5 then
	  tle=getrnd(dirtle)
	 elseif tle==6 then
	  tle=12
	 end
	 tmap[pos+18]=tle
 end
end

function dirt(pos)
 return (pos<36 or fget(tmap[pos-18],7)) and 5 or getrnd(dirtle)
end

function teleport(mob)
 for p=20,305 do
  if tmap[p]==7 and isw(p,"checkmobs") then 
   mob.pos=p
   sfx"1"
   return
  end
 end
end

function blind(mob)
 if mob.sight>1 then
	 mob.sight,mob.recover=1,30
	 if mob==😐 then
	  sfx"0"
	  addfloat("blind",😐.pos,9)
	  fog=blankmap(1)
	  unfog()
	 end
 end
end
-->8
--ui

function addfloat(_txt,pos,_c)
 local _x,_y=postoscreen(pos)
 _x+=4-#_txt*2
 add(floats,{txt=_txt,x=_x,y=_y,c=_c,ty=_y-10,t=0})
end

function addwind(_x,_y,_w,_h,_txt)
 local w={x=_x,
          y=_y,
          w=_w,
          h=_h,
          txt=_txt}
 add(wind,w)
 return w
end

function drawind()
 for w in all(wind) do
  local wx,wy,ww,wh=w.x,w.y,w.w,w.h
  rectfill(wx,wy,wx+ww-1,wy+wh-1,0)
  if w.noborder!=true then rect(wx+1,wy+1,wx+ww-2,wy+wh-2,6) end
  wx+=4
  wy+=4
  clip(wx,wy-1,ww-8,wh-6)
  if w.cur then
   wx+=6
  end
  for i=1,#w.txt do
   local txt,c=w.txt[i],6
   if i==w.cur then
    spr(175,wx-4.5+sin(time()),wy)
    if w.invert then
     rectfill(wx-1,wy-1,wx+#txt*4,wy+5,7)
    end
   end
   if w.col and w.col[i] then
    c=w.col[i]
   end
   if w.icn and w.icn[i] then
    pal(10,w.invert and 0 or 10)
    spr(w.icn[i]+115,wx,wy)
    pal()
   end
   print(txt,wx,wy,c)
   wy+=6
  end
  
  clip()
  if w.dur then
   w.dur-=1
   if w.dur<=0 then
    local dif=w.h/4
    w.y+=dif/2
    w.h-=dif
    if w.h<3 then
     del(wind,w)
    end
   end
  end
 end
end

function showmsg(txt)
 local wid=(#txt+2)*4+7
 local w=addwind(63-wid/2,50,wid,13,{" "..txt})
 w.dur=120
end

function dohpwind()
 local hpy=😐.pos<161 and 110 or 5
 hpwind=hpwind or addwind(5,hpy,23,13,{})
 if _upd==update_inv then hpy=5 end
 hpwind.txt[1]="♥"..😐.hp
 hpwind.y+=(hpy-hpwind.y)/5
end

function showinv()
 local txt,col,icn={},{},{}
 _upd=update_inv
 for i=1,4 do
  if eqp[i] then
   add(txt,"  "..pick_name[eqp[i].typ].." ("..eqp[i].chrg..")")
   add(col,6)
   icn[i]=eqp[i].typ
  else
   add(txt,"...")
   add(col,5)
  end
 end

 invwind=addwind(5,17,88,31,txt)
 invwind.cur,invwind.col,invwind.icn=1,col,icn
 keywind=addwind(27,5,20,13,{"  "..key})
 keywind.icn={11}
 flrwind=addwind(46,5,47,13,{"floor "..floor})
 if 😐.sight==1 then
  flrwind.txt[1]="blind ⧗"..😐.recover
 end
 updatedesc()
end

function hideinv()
 invwind.dur,keywind.dur,flrwind.dur=5,5,5
 if descwind then
		descwind.dur,descwind=0,nil
 end
end

function updatedesc()
 if seleqp then
  if not descwind then
   descwind=addwind(5,47,88,37,{})
  end
  local et=seleqp.typ
  descwind.txt={
   pick_name[et],"",
   pick_desc2d[et][1],
   pick_desc2d[et][2],
   pick_desc2d[et][3]}
 else
  if descwind then
   descwind.dur,descwind=0,nil
  end
 end
end

function shoot(from,to,sprite,flipx,flipy)
 local fx,fy=postoscreen(from)
 local d,sprite,tx,ty=dist(from,to)*8,sprite or 84,postoscreen(to)
 local sp={
  ani={sprite},
  t=0,
  maxt=d/3,
  x=fx,
  y=fy,
  dx=mysgn(tx-fx)*3,
  dy=mysgn(ty-fy)*3,
  flx=flipx,
  fly=flipy
 }
 add(sprs,sp)
 return sp
end

function rope(from,to)
 local fx,fy=postoscreen(from)
 local tx,ty=postoscreen(to)
 if fx!=tx and fy!=ty then
  return
 end
 local d,tip,tail,dirx,diry=dist(from,to)*8,87,88,mysgn(tx-fx),mysgn(ty-fy)
 if ty!=fy then
  tip,tail=85,101
 end
 local tax,tay,tat=fx+dirx*4,fy+diry*4,-4/3
 repeat
	 local sp={
	  ani={tail},
	  t=tat,
	  maxt=d/3+tat,
	  x=tax,
	  y=tay
	 }
	 add(sprs,sp)
	 tax+=dirx*8
	 tay+=diry*8
	 tat-=8/3
 until abs(tax-tx)<8 and abs(tay-ty)<8 
 return shoot(from,to,tip,tx>fx,ty>fy)
end

-->8
--mobs and items

function addmob(_typ,_pos)
 local mty=mob_type[_typ]
 local m={
  typ=_typ,
  pos=_pos,
  ox=0,
  dt=0.125,
  oy=0,
  flp=false,
  flash=0,
  aspd=mob_aspd[_typ],
  oaspd=mob_aspd[_typ],
  sight=4,
  aicool=0,
  charge=0,
  recover=0,
  vis=true,
  hp=mob_hp[_typ],
  ani=explodeval(mob_ani[_typ],"|"),
  task=brain_w[mob_brain[_typ]],
  taska=brain_a[mob_brain[_typ]],
  ai=mty=="ai" or mty=="we", 
  ob=mty=="ob",
  we=mty=="we"
 }
 add(mobs,m)
 return m
end

function addpick(_typ,_pos)
 local p={
  typ=_typ,
  dt=0.07,
  pos=_pos,
  chrg=2,
  ox=0,
  oy=0,
  ani=explodeval("96,112,113,112,96,96,96,96"),
  hop=_typ>1
 }
 
 if _typ==0 then
  p.ani=explodeval("68,69,68,70,68,68,68,68")
 elseif _typ==1 then
  p.ani=explodeval("102,103,102,104,102,102,102,102")
 end
 add(picks,p)
 return p
end

function checkend(mb)
 if mb.t>=1 then
  mb.mov,mb.aspd=nil,mb.oaspd
  if mb.trig then
   mb.trig=false
   trig_step(mb)
  end
  if mb.pounce then
   mb.pounce=false
   ai_dobump(mb)
  end
 end
end

function mobwalk(mb,dr)
 mobdir(mb,dr)
 mb.pos+=dirpos[dr]
 mb.sox,mb.soy,mb.mov,mb.aspd,mb.t=-dirx[dr]*8,-diry[dr]*8,mov_walk,6,0
 mb.ox,mb.oy=mb.sox,mb.soy
end

function mobbump(mb,dr,dst)
 local dst = dst or 8
 mobdir(mb,dr)
 mb.sox,mb.soy,mb.ox,mb.oy,mb.mov,mb.t=dirx[dr]*dst,diry[dr]*dst,0,0,mov_bump,0
end

function mobhop(mb,to)
 local fx,fy=postoscreen(mb.pos)
 local tx,ty=postoscreen(to)
 mb.sox,mb.soy,mb.mov,mb.hoph,mb.t,mb.pos=fx-tx,fy-ty,mov_hop,4,0,to
 mb.ox,mb.oy=mb.sox,mb.soy
end

function mobdir(mb,dr)
 mb.flp = dirx[dr]==0 and mb.flp or dirx[dr]<0
end

function mov_walk(self)
 local tme=1-max(self.t,0)
 self.ox,self.oy=self.sox*tme,self.soy*tme
end

function mov_bump(self)
 local mt=max(self.t,0)
 local tme=mt>0.5 and 1-mt or mt
 self.ox,self.oy=self.sox*tme,self.soy*tme
end

function mov_hop(self)
 local tme=1-max(self.t,0)
 self.ox,self.oy=self.sox*tme,self.soy*tme+sin(tme/2)*self.hoph
end

function doai(wee)
 local moving=false
 
 for m in all(mobs) do
  if m!=😐 and m.we==wee then
   if m.stun then
    m.stun=false
   else
    moving=m.task(m) or moving
   end
  end
 end
  
 if moving then
  _upd=update_anis
 else
  passturn()
 end
end

function ai_wait(m) 
 if sight(m,😐.pos) then
  m.task,m.tpos,m.aicool,m.active,buttbuff=m.taska,😐.pos,0,true,0
  addfloat("!",m.pos,10)
 end
 return false
end

function ai_blank()
 return false
end

function ai_weed(m)
 for i=1,4 do
  local mb=getmob(m.pos+dirpos[i])
  if mb then
   mobbump(m,i)
   hitmob(mb,1)
   return true
  end
 end
 return false
end

function ai_dobump(m)
 local d=5
 if dist(m.pos,😐.pos)==1 then
  repeat
   d-=1
  until dirpos[d]==😐.pos-m.pos or d==1
  mobbump(m,d)
  hitmob(😐,1)
  if m.typ==4 then
   blind(😐)
  end
  return true
 end
 return false
end

function ai_tcheck(m)
 m.aicool+=1
 if sight(m,😐.pos) then
  m.tpos,m.aicool=😐.pos,0
 end
 if m.pos==m.tpos or m.aicool>8 then
  m.task,m.active=ai_wait,false
  addfloat("?",m.pos,10)
  return false
 end
 return true
end

function ai_attac(m)
 m.vis=true
 if ai_dobump(m) then
  return true
 elseif ai_tcheck(m) then
  local cand=getnextstep(m.pos,m.tpos)
  if cand>0 then
   mobwalk(m,cand)
   if m.typ==6 and dist(m.pos,😐.pos)>1 and rnd(3)>1 then
    m.vis=false     
   end
   m.trig=true
   return true
  end
 end
 return false
end

function ai_kong(m)
 if ai_dobump(m) then
  return true
 elseif ai_tcheck(m) then
  local cand,cand2,d2=getnextstep(m.pos,m.tpos)

  local px,py=postoxy(m.tpos)
  local mx,my=postoxy(m.pos)
  if mx==px or my==py then
   for i=1,4 do
    local pos=m.pos+dirpos[i]
    while cand2==nil and pos!=m.tpos and isw(pos) do
     if isw(pos,"smartmob") and distmap[pos]==1 then
      cand2,d2=pos,i
     end
     pos+=dirpos[i]
    end 
   end   
  end
   
  if cand2 then
   mobdir(m,d2)
   mobhop(m,cand2)
   m.trig,m.pounce=true,true
   sfx"1"
   return true
  else
   if cand>0 then
    mobwalk(m,cand)
    m.trig=true
    return true
   end
  end
 end
 return false
end

function ai_reaper(m)
 if ai_dobump(m) then
  return true
 else
  local cand=getnextstep(m.pos,😐.pos)
  if cand>0 then
   mobwalk(m,cand)
   m.trig=true
   return true
  end
 end
 return false 
end

function getnextstep(from,to,rev,mode)
 local bdst,cand,mode=999,0,mode or "ai"
 calcdist(to,mode)
 for i=1,4 do
  local npos=from+dirpos[i]
  if isw(npos,"smartmob") then
   local dst=distmap[npos]+rnd()
   if dst>0 then
	   if rev then
	    dst=-dst
	   end
	   if dst<bdst then
	    cand,bdst=i,dst
	   end
   end
  end
 end
 if cand==0 then
  if mode=="ai" then
   return getnextstep(from,to,rev,"smart")
  elseif mode=="smart" then
   return getnextstep(from,to,rev,"dist")
  end
 end
 
 return cand
end

function ai_queen(m)
 if not sight(m,😐.pos) then
  m.task,m.active=ai_wait,false
  addfloat("?",m.pos,10) 
 else
  if m.charge==0 then
   local cand=getnextstep(m.pos,😐.pos)
   if cand>0 then
    mobhop(addmob(2,m.pos),m.pos+dirpos[cand])
	   m.charge=2
	   return true
   end   
  else
   m.charge-=1
   local cand=getnextstep(m.pos,😐.pos,true)
   if cand>0 then
    mobwalk(m,cand)
    m.trig=true
    return true
   end   
  end
 end
 return false
end

function spawnmobs(ind,pack)
 local pospot,maxi={},#mob_plan[floor]
 
 for r in all(rooms) do
  if not r.nospawn then
   for p in all(r.tiles) do
	   if isw(p,"smartmob") then
	    if r.avoid!=true or (pack and noneighs(p)) then
		    add(pospot,p)
		   end
	   end
	  end
  end
 end

 while #pospot>0 and ind<=maxi do
  local p=getrnd(pospot)
  addmob(mob_plan[floor][ind],p)
  del(pospot,p)
  ind+=1
 end
 if ind<=maxi and pack!=true then
  spawnmobs(ind,true)
 end
 if dogate then
  for mb in all(mobs) do
   if mb.ai and not mb.we then
    mb.haskey=true
    return
   end
  end
 end
end

function droppick_rnd(pos)
 droppick(ceil(rnd(10))+1,pos)
end

function droppick(pick,pos)
 local dpos=dropspot(pos)
 local pck=addpick(pick,pos)
 mobhop(pck,dpos)
 pck.hoph=12
end

function dropspot(pos)
 local best,bstd=999,-1 
 for p=20,305 do
  local d=dist(pos,p)+rnd()
  if d<best and isw(p,"smartmob") and not getpick(p) then
   best,bstd=d,p
  end
 end
 return bstd
end
-->8
--gen
function genfloor(f)
 buttbuff,steps,floor,turn,mobs,dmobs,picks,floats,wind,fog,voidmap=0,0,f,"player",{😐},{},{},{},{hpwind},blankmap(0),blankmap(0) poke(0x3101,66)
 if floor==0 then  
  copymap(0,0)
  addmob(15,153)
 elseif floor==winfloor then
  copymap(16,0)
 else
  fog=blankmap(1)
  mapgen()
  unfog()
  showmsg("floor "..floor)
 end
end

function mapgen()
 repeat
  flags,flaglib,tmap,roomap,rooms,voids=blankmap(0),{},blankmap(2),blankmap(0),{},{}
  dogate,epos=floor%3==0
  if dogate then
   local mip=getrnd(explode2d("32,0|48,0|64,0|80,0|96,0|112,0|0,16|16,16|32,16|48,16|64,16|80,16|96,16|112,16"))
   copymap(mip[1],mip[2])
  end
  
  --genrooms
	 local fmax,rmax,mw,mh=5,4,10,10
	 repeat
		 local _w=3+flr(rnd(mw-2))
	  if placeroom({w=_w,h=3+flr(rnd(mid(35/_w,3,mh)-2))}) then
	   if #rooms==1 then
	    mw/=2
	    mh/=2
	   end
	   rmax-=1
	  else
	   fmax-=1
	  end
	 until fmax<=0 or rmax<=0
  
  --mazeworm
	 repeat
	  local cand={}
	  for p=20,305 do
	   if cancarve(p,false) and not nexttoroom(p) then
	    add(cand,p)
	   end
	  end
	 
	  if #cand>0 then
	   digworm(getrnd(cand))
	  end
	 until #cand<=1

  --placeflags	 
	 local curf=1
	 for p=20,305 do
	  if isw(p) and flags[p]==0 then
    growflag(p,curf)
	   add(flaglib,curf)
	   curf+=1
	  end 
	 end 
	
	 --carvedoors
	 repeat
	  local drs={}
	  for p=20,305 do
	   if tmap[p]>-1 and tmap[p]!=86 and not isw(p) then
	    local found=sigarray(getsig(p),dor_sig,dor_msk)
	    local dif=found==1 and 18 or 1
	    local _f1,_f2=flags[p-dif],flags[p+dif]
	    if found>0 and _f1!=_f2 then
	     add(drs,{pos=p,f1=_f1,f2=_f2})
	    end
	   end
	  end  
	  if #drs>0 then
	   local d=getrnd(drs)
	   tmap[d.pos]=1
	   growflag(d.pos,d.f1)
	   del(flaglib,d.f2)
	  end
	 until #drs==0
	 
 until #flaglib==1
 
 --carvescuts
 local x1,y1,x2,y2,cut,found,drs=1,1,1,1,0
 repeat
  local drs={}
  for p=20,305 do
   if tmap[p]>-1 and tmap[p]!=86 and not isw(p) then
    local found=sigarray(getsig(p),dor_sig,dor_msk)
    local dif=found==1 and 18 or 1
    local p1,p2=p-dif,p+dif
    if found>0 then
     calcdist(p1)
     if distmap[p2]>20 then
      add(drs,p)
     end
    end
   end
  end
  if #drs>0 then
   tmap[getrnd(drs)]=1
   cut+=1
  end
 until #drs==0 or cut>=3
 
 --startend
 local high=0
 if not dogate then
	 repeat
	  epos=flr(rnd(286))+20 
	 until isw(epos)
	end
 calcdist(epos)
 for p=20,305 do
  if isw(p) and distmap[p]>high then
   spawnpos,high=p,distmap[p]
  end
 end 
 calcdist(spawnpos)
 if not dogate then
	 high=0
	 for p=20,305 do
	  if distmap[p]>high and roomap[p]>0 and freestanding(p)>0 then
	   epos,high=p,distmap[p]
	  end
	 end
 end
 high=9999
 for p=20,305 do
  local tmp=distmap[p]
  if tmp>=0 then
   local score=starscore(p)
   tmp=tmp-score
   if tmp<high and score>=0 then
    spawnpos,high=p,tmp
   end
  end
 end
 if roomap[spawnpos]>0 then
  rooms[roomap[spawnpos]].nospawn=true
 end
 tmap[spawnpos],😐.pos,tmap[epos]=15,spawnpos,14

 --fillends
 repeat
  local filled=false
  for p=20,305 do
   if cancarve(p,true) and tmap[p]!=14 and tmap[p]!=15 then
    filled,tmap[p]=true,2
   end
  end
 until not filled

 --prettywalls
 for p=20,305 do
  local tle,blw=tmap[p],not isw(p-18)
  if tle==86 then
   tle=2
  end
  if tle==2 then
   local ntle=sigarray(getsig(p),wall_sig,wall_msk)
   tle = ntle==0 and 3 or 15+ntle
   if fget(tle,6) and rnd(8)<1 then
    tle+=160
    if tle>209 then
     tle-=33
    end
   end
  elseif tle==1 and blw then
   tle=fget(tmap[p-18],3) and 180 or 4
  end
  tmap[p]=tle
 end

 if dogate then
  tmap[gpos]=63
  if floor<9 then
   addpick(0,♥pos)
  end
 end
 
 --voids
 for p=20,305 do
  if tmap[p]==3 then  
		 local cand,thisv,num,candnew={p},{tiles={p},walls={}},#voids+1
   add(voids,thisv)
		 voidmap[p],tmap[p]=num,11
		 repeat
		  candnew={}
		  for c in all(cand) do
		   for d=1,4 do
		    local dpos=c+dirpos[d]
		    if tmap[dpos]==3 and voidmap[dpos]==0 then
		     voidmap[dpos],tmap[dpos]=num,getrnd(voitle)
 	     add(thisv.tiles,dpos)
	      add(candnew,dpos)
		    elseif fget(tmap[dpos],6) then
		     add(thisv.walls,dpos)
		    end
		   end
		  end
		  cand=candnew
		 until #cand==0
   thisv.exit=getrnd(thisv.walls)
   if thisv.exit and tmap[thisv.exit]>176 then
    tmap[thisv.exit]-=160
   end
  end
 end

 --chests
 local r,cand,telinlvl,p,pchest=getrnd(rooms),{},floor>=5 and rnd(5)<1
 repeat
 	pchest=getrnd(r.inside)
 until tmap[pchest]==1
 for v in all(voids) do
  add(cand,getrnd(v.tiles))
 end
 if telinlvl then
  add(cand,pchest) 
 end
 if #cand>2 then
  for i=1,2 do
   p=getrnd(cand)
   del(cand,p)
   tmap[p]=7
  end
 end
 if not telinlvl then
  add(cand,pchest) 
 end 
 for c in all(cand) do
  local chst=addmob(15,c)
  if floor>=5 and rnd(5)<1 then
   chst.♥=true
  end
 end

 --deco
 tarr_vase,tarr_dirt,tarr_plant,funcs,func,rpot=explodeval("0,0,0,0,0,0,13,14"),explodeval("1,74,75,76"),explodeval("12,13,71"),explode("vase,dirt,carpet,torch,plant"),"vase",{}
 for r in all(rooms) do
  add(rpot,r)
 end 
 repeat
  local r=getrnd(rpot)
  del(rpot,r)
  for pos in all(r.tiles) do
   local tle=tmap[pos]
   
   if func=="vase" then  
			 local mob=getrnd(tarr_vase)
			 if mob>0 
			  and isw(pos,"smartmob")
			  and freestanding(pos)>0
			  and find(r.edges,pos)
			  then
			  addmob(mob,pos)
			 end
			 
   elseif func=="dirt" then  
			 if tle==1 then
  			tle=getrnd(tarr_dirt)
			 end
			 
   elseif func=="carpet" then  
			 if tle==1 then
				 if find(r.inside,pos) then
				  tle=8
				 end
				end
				
   elseif func=="plant" then   
			 if tle==1 then
			  tle=getrnd(tarr_plant)
			 elseif tle==4 then
			  tle=6
			 end
			 if isw(pos,"smartmob") and not r.nospawn and rnd(4)<1 and noneighs(pos) and freestanding(pos)>0 then
			  local mb=getrnd({9,9,10})
			  addmob(mb,pos)
			  if mb==9 then
			   r.avoid=true
			  end
			 end 
 		end

			if func=="torch" or func=="carpet" then
			 if tle==1 and find(r.edges,pos) then
			  local x,y=postoxy(pos)
			  if rnd(3)>1 and y%2==1 and freestanding(pos)>0 then
			   if x==r.x then
			    tle=64
			   elseif x==r.x+r.w-1 then
			    tle=66
			   end
			  end
			 end 			
   end 			
 			
			tmap[pos]=tle
  end
  
  if func!="plant" and r.nospawn!=true then
		 for p in all(r.tiles) do
		  if tmap[p]==1 and not getmob(p) and freestanding(p)>0 then
		   if rnd(10)<1 then
		    tmap[p]=81
		   end
		  end
		 end
  end
  func=getrnd(funcs)
 until #rpot==0 

 spawnmobs(1) 
end

function placeroom(r)
 local cand,c={}
 for _x=1,17-r.w do
  for _y=1,17-r.h do
   if doesroomfit(r,_x,_y) then
    add(cand,{x=_x,y=_y})
   end
  end
 end
 
 if #cand==0 then return false end
 
 c=getrnd(cand)
 r.x,r.y,r.pos,r.tiles,r.edges,r.inside=c.x,c.y,xytopos(c.x,c.y),{},{},{}
 add(rooms,r) 
 for _x=0,r.w-1 do
  for _y=0,r.h-1 do
   local pos=xytopos(_x+r.x,_y+r.y)
   tmap[pos],roomap[pos]=1,#rooms
   add(r.tiles,pos)
   if _x==0 or _y==0 or _x==r.w-1 or _y==r.h-1 then
    add(r.edges,pos)
   else
    add(r.inside,pos)
   end
  end
 end
 return true
end

function doesroomfit(r,x,y)
 for _x=-1,r.w do
  for _y=-1,r.h do
   if isw(xytopos(_x+x,_y+y)) then
    return false
   end
  end
 end
 return true
end

function digworm(pos)
 local dr,stp=1+flr(rnd(4)),0
 repeat
  tmap[pos]=1
  if not cancarve(pos+dirpos[dr],false) or (rnd()<0.5 and stp>2) then
   stp=0
   local cand={}
   for i=1,4 do
    if cancarve(pos+dirpos[i],false) then
     add(cand,i)
    end
   end
   dr=#cand==0 and 8 or getrnd(cand)
  end
  pos+=dirpos[dr]
  stp+=1
 until dr==8 
end

function cancarve(pos,walk)
 if tmap[pos]==-1 or tmap[pos]==86 then return false end
 local walk= walk==nil and isw(pos) or walk
 
 if isw(pos)==walk then
  return sigarray(getsig(pos),crv_sig,crv_msk)!=0
 end
 return false
end

function getsig(pos)
 local sig,digit=0
 for i=1,8 do
  digit=isw(pos+dirpos[i]) and 0 or 1
  sig=shl(sig,1)+digit
 end
 return sig
end

function bcomp(sig,match,mask)
 local mask=mask and mask or 0
 return bor(sig,mask)==bor(match,mask)
end

function sigarray(sig,arr,marr)
 for i=1,#arr do
  if bcomp(sig,arr[i],marr[i]) then 
   return i
  end
 end
 return 0
end

function nexttoroom(pos,dirs)
 local dirs = dirs or 4
 for i=1,dirs do
  if roomap[pos+dirpos[i]]>0 then
   return true
  end
 end
 return false
end

function growflag(pos,flg)
 local cand,candnew={pos}
 flags[pos]=flg
 repeat
  candnew={}
  for c in all(cand) do
   for d=1,4 do
    local dpos=c+dirpos[d]
    if isw(dpos) and flags[dpos]!=flg then
     flags[dpos]=flg
     add(candnew,dpos)
    end
   end
  end
  cand=candnew
 until #cand==0
end

function starscore(pos)
 if tmap[pos]>-1 then
  local scr=freestanding(pos)
  if roomap[pos]==0 then
   if nexttoroom(pos,8) then return -1 end
   if scr>0 then
    return 5
   else
    if (cancarve(pos)) return 0
   end
  else
   if scr>0 then
    return scr<=8 and 3 or 0
   end
  end
 end
 return -1
end

function freestanding(pos)
 if tmap[pos]==-1 then return false end
 return sigarray(getsig(pos),free_sig,free_msk)
end