-- ~celeste~
-- matt thorson + noel berry

-- globals --
-------------

room = { x=0, y=0 }
objects = {}
types = {}
freeze=0
shake=0
will_restart=false
delay_restart=0
got_fruit={}
has_dashed=false
sfx_timer=0
has_key=false
pause_player=false
flash_bg=false
music_timer=0
frames=0
seconds=0
minutes=0
start_game=false
start_game_flash=0

k_left=0
k_right=1
k_up=2
k_down=3
k_jump=4
k_dash=5

function level_index()
	return room.x%8+room.y*8
end

function is_title()
	return level_index()==31
end

-- effects --
-------------

clouds = {}
for i=0,16 do
	add(clouds,{
		x=rnd(128),
		y=rnd(128),
		spd=1+rnd(4),
		w=32+rnd(32)
	})
end

particles = {}
for i=0,24 do
	add(particles,{
		x=rnd(128),
		y=rnd(128),
		s=0+flr(rnd(5)/4),
		spd=0.25+rnd(5),
		off=rnd(1),
		c=6+flr(0.5+rnd(1))
	})
end

-- helper functions --
----------------------

function clamp(val,a,b)
	return max(a, min(b, val))
end

function appr(val,target,amount)
 return val > target 
 	and max(val - amount, target) 
 	or min(val + amount, target)
end

function sign(v)
	return v>0 and 1 or
			v<0 and -1 or 0
end

function maybe()
	return rnd(1)<0.5
end

-- tile helpers --
------------------

function tile_at(x,y)
 return mget(room.x * 16 + x, room.y * 16 + y)
end

function tile_flag_at(x,y,w,h,flag)
 for i=max(0,flr(x/8)),min(15,(x+w-1)/8) do
 	for j=max(0,flr(y/8)),min(15,(y+h-1)/8) do
 		if fget(tile_at(i,j),flag) then
 			return true
 		end
 	end
 end
	return false
end

function solid_at(x,y,w,h)
 return tile_flag_at(x,y,w,h,0)
end

function ice_at(x,y,w,h)
 return tile_flag_at(x,y,w,h,4)
end

function spikes_at(x,y,w,h,xspd,yspd)
 for i=max(0,flr(x/8)),min(15,(x+w-1)/8) do
 	for j=max(0,flr(y/8)),min(15,(y+h-1)/8) do
 	 local tile=tile_at(i,j)
 	 if tile==17 and ((y+h-1)%8>=6 or y+h==j*8+8) and yspd>=0 then
 	 	return true
 	 elseif tile==27 and y%8<=2 and yspd<=0 then
 	 	return true
 	 		elseif tile==43 and x%8<=2 and xspd<=0 then
 	 	 	return true
 	 	elseif tile==59 and ((x+w-1)%8>=6 or x+w==i*8+8) and xspd>=0 then
 	 	 	return true
 	 	end
 	end
 end
	return false
end

-- object functions --
-----------------------

function init_object(type,x,y)
 local obj = {}
 obj.type = type
 obj.collideable = true
 obj.solids = true

 obj.spr = type.tile
 obj.flip = { x=false, y=false }

 obj.x = x
 obj.y = y
 obj.hitbox = { x=0, y=0, w=8, h=8 }

 obj.spd = { x=0, y=0 }
 obj.rem = { x=0, y=0 }

 obj.is_solid=function(ox,oy)
 	return solid_at(obj.x+obj.hitbox.x+ox,obj.y+obj.hitbox.y+oy,obj.hitbox.w,obj.hitbox.h)
 end
 
 obj.is_ice=function(ox,oy)
 	return ice_at(obj.x+obj.hitbox.x+ox,obj.y+obj.hitbox.y+oy,obj.hitbox.w,obj.hitbox.h)
 end
 
 obj.collide=function(type,ox,oy)
 	local other
 	for i=1,count(objects) do
 		other=objects[i]
 		if other ~=nil and other.type == type and other != obj and other.collideable and
 			other.x+other.hitbox.x+other.hitbox.w > obj.x+obj.hitbox.x+ox and 
 			other.y+other.hitbox.y+other.hitbox.h > obj.y+obj.hitbox.y+oy and
 			other.x+other.hitbox.x < obj.x+obj.hitbox.x+obj.hitbox.w+ox and 
 			other.y+other.hitbox.y < obj.y+obj.hitbox.y+obj.hitbox.h+oy then
 			return other
 		end
 	end
 	return nil
 end
 
 obj.check=function(type,ox,oy)
 	return obj.collide(type,ox,oy) ~=nil
 end
 
 obj.move=function(ox,oy)
 	local amount
 	-- [x] get move amount
 	obj.rem.x += ox
 	amount = flr(obj.rem.x + 0.5)
 	obj.rem.x -= amount
 	obj.move_x(amount,0)
 	
 	-- [y] get move amount
 	obj.rem.y += oy
 	amount = flr(obj.rem.y + 0.5)
 	obj.rem.y -= amount
 	obj.move_y(amount)
 end
 
 obj.move_x=function(amount,start)
 	if obj.solids then
 		local step = sign(amount)
 		for i=start,abs(amount) do
 			if not obj.is_solid(step,0) then
 				obj.x += step
 			else
 				obj.spd.x = 0
 				obj.rem.x = 0
 				break
 			end
 		end
 	else
 		obj.x += amount
 	end
 end
 
 obj.move_y=function(amount)
 	if obj.solids then
 		local step = sign(amount)
 		for i=0,abs(amount) do
 			if not obj.is_solid(0,step) then
 				obj.y += step
 			else
 				obj.spd.y = 0
 				obj.rem.y = 0
 				break
 			end
 		end
 	else
 		obj.y += amount
 	end
 end

 add(objects, obj)
 if obj.type.init ~= nil then
 	obj.type.init(obj)
 end
 return obj
end

function destroy_object(obj)
 del(objects, obj)
end

function draw_object(obj)

	if obj.type.draw ~=nil then
		obj.type.draw(obj)
	elseif obj.spr > 0 then
		spr(obj.spr,obj.x,obj.y,1,1,obj.flip.x,obj.flip.y)
	end

end

-- update function --
-----------------------

function _update()
	frames=((frames+1)%30)
	if frames==0 then
		seconds=((seconds+1)%60)
		if seconds==0 then
			minutes+=1
		end
	end
	
	if music_timer>0 then
 	music_timer-=1
 	if music_timer<=0 then
 	 music(10,0,7)
 	end
 	end
	
 	if sfx_timer>0 then
 	 sfx_timer-=1
 	end
	
 	-- cancel if freeze
 	if freeze>0 then freeze-=1 return end

 	-- screenshake
 	if shake>0 then
 		shake-=1
 		camera()
 		if shake>0 then
 			camera(-2+rnd(5),-2+rnd(5))
 		end
 	end
	
 	-- restart (soon)
 	if will_restart and delay_restart>0 then
 		delay_restart-=1
 		if delay_restart<=0 then
 			will_restart=false
 			load_room(room.x,room.y)
 		end
 	end

 	-- update each object
 	foreach(objects,function(obj)
 		obj.move(obj.spd.x,obj.spd.y)
 		if obj.type.update~=nil then
 			obj.type.update(obj)
 		end
 	end)
end

-- drawing functions --
-----------------------

function _draw()
	if freeze>0 then return end

	pal()
	rectfill(0,0,128,128,0)

	-- clouds
	if not is_title() then
		foreach(clouds, function(c)
			c.x += c.spd
			rectfill(c.x,c.y,c.x+c.w,c.y+4+(1-c.w/64)*12,1)
			if c.x > 128 then
				c.x = -c.w
				c.y=rnd(128-8)
			end
		end)
	end

	-- particles
	foreach(particles, function(p)
		p.x += p.spd
		p.y += sin(p.off)
		p.off+= min(0.05,p.spd/32)
		rectfill(p.x,p.y,p.x+p.s,p.y+p.s,p.c)
		if p.x>128+4 then 
			p.x=-4
			p.y=rnd(128)
		end
	end)

	map(room.x * 16,room.y * 16,0,0,16,16,4)

	foreach(objects,draw_object)

	map(room.x * 16,room.y * 16,0,0,16,16,8)
end
