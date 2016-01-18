require("Game.blocks.lua");

threeEraseGame = class("threeEraseGame");

local colorMap = 
{
	[1] = Color.New(1, 0, 0, 1);	
	[2] = Color.New(0, 1, 0, 1);
	[3] = Color.New(0, 0, 1, 1);
	[4] = Color.New(1, 1, 0, 1);
	[5] = Color.New(0, 1, 1, 1);
	[6] = Color.New(1, 0, 1, 1);
};

function threeEraseGame:ctor()
	
	print("threeEraseGame  ctor");
	
	self.blocks = blocks.New();
	self.blocks:init(9, 9, 6);
	self.blocks:generate();
	--blocks:test();

	self.blocks:printBlocks();

	self.blockInstance = {};

	self.touchDownPos = Vector2.New(-1, -1);
	self.moveBlock = Vector2.New(-1, -1);
	self.moveBlockLocked = false;


	local go = UnityEngine.Resources.Load("ui/block", GameObject.GetClassType());
	local canvas = GameObject.Find("UI(Clone)/Canvas");

	local w = self.blocks:getWidth();
	local h = self.blocks:getHeight();

	local data = self.blocks:getdata();

	xoffset = 100;
	yoffset = 100;
	size = 30;

	for i=1, h do
		
		xoffset = 100;

		for j=1, w do

			-- position
			local instance = GameObject.Instantiate(go);
			local rect = instance:GetComponent(RectTransform.GetClassType());
			instance.transform:SetParent(canvas.transform, false);

			rect.anchoredPosition = Vector2.New(xoffset, -yoffset);
			rect.sizeDelta = Vector2.New(size, size);

			-- color
			local image = instance:GetComponent(Image.GetClassType());
			image.color = colorMap[data[j][i]];

			local index = self.blocks:getIndexByPos(j, i);

			-- button
			local btn = instance:GetComponent(Button.GetClassType());
			btn.onClick:AddListener(function ()
				-- body
				--print("On Click "..index);

			end);

			self.blockInstance[self.blocks:getIndexByPos(j,i)] = instance;

			-- box collider
			
			--print("anchoredPosition "..tostring(rect.anchoredPosition));
			--print("anchorMin "..tostring(rect.anchorMin));
			--print("anchorMax "..tostring(rect.anchorMax));
			--print("anchoredPosition3D "..tostring(rect.anchoredPosition3D));
			--print("sizeDelta "..tostring(rect.sizeDelta));
			--print("pivot "..tostring(rect.pivot));
			--print("offsetMin "..tostring(rect.offsetMin));
			--print("offsetMax "..tostring(rect.offsetMax));

			xoffset = xoffset + size;
		end
		
		yoffset = yoffset + size;
	end


end

function threeEraseGame:onTouchDown( x, y )
	-- body

	if self.blockInstance then
	
		for k,v in pairs(self.blockInstance ) do
			
			local rect = v:GetComponent(RectTransform.GetClassType());

			local contains = RectTransformUtility.RectangleContainsScreenPoint(rect, Vector2.New(x, y));

			if contains then
				--print("onTouchDown K"..k);

				self.touchDownPos.x = x;
				self.touchDownPos.y = y;

				local x, y = self.blocks:getPosByIndex(k);

				self.moveBlock = Vector2.New(x, y);

				break;
			end
		end
	end

end

function threeEraseGame:onTouchMove( x, y )
	-- body

	if self.touchDownPos.x < 0 or self.touchDownPos.y < 0 then
		return;
	end

	local nowPos = Vector2.New(x, y);
	local moveDir = nowPos - self.touchDownPos;

	if moveDir:Magnitude() >= 30 then
		
		--print(moveDir);

		--print(Vector2.Dot(Vector2.up:Normalize(), moveDir:Normalize()));

		-- move offset 30
		local angel = Vector2.Angle(Vector2.up, moveDir);

		--print("on move angel "..angel);

		if moveDir.x > 0 then
		
			-- right
			if angel >=0 and angel < 45 then
			
			-- up
				--print("up");
				self:onMoveBlock("up");

			elseif angel >= 45 and angel < 135 then
			-- right
				
				--print("right");

				self:onMoveBlock("right");
			else
			-- down
				--print("down");

				self:onMoveBlock("down");
			end

		else
		
			-- left

			if angel >=0 and angel < 45 then
			
			-- up
				--print("up");

				self:onMoveBlock("up");

			elseif angel >= 45 and angel < 135 then
			-- left
				
				--print("left");

				self:onMoveBlock("left");
			else
			-- down
				
				--print("down");
				self:onMoveBlock("down");
			end

		end

	end

end


function  threeEraseGame:onTouchUp( x, y )
	-- body

	self.touchDownPos.x = -1;
	self.touchDownPos.y = -1;

	self.moveBlock = Vector2.New(-1, -1);
end

function threeEraseGame:onMoveBlock( dir )
	-- body
	-- find swap one

	local x1 = self.moveBlock.x;
	local y1 = self.moveBlock.y;

	local x2 = -1;
	local y2 = -1;

	if dir == "left" then
		
		x2 = x1 - 1;
		y2 = y1;

	elseif dir == "right" then

		x2 = x1 + 1;
		y2 = y1;

	elseif dir == "up" then

		x2 = x1;
		y2 = y1 - 1;

	elseif dir == "down" then

		x2 = x1;
		y2 = y1 + 1;

	end

	if x2 <= 0 or y2 <=0 or x2 > self.blocks:getWidth() or y2 > self.blocks:getHeight() then
		
		return;

	end

	if self.moveBlockLocked then
		return;
	end

	self.moveBlockLocked = true;

	self:swapBlocks(x1, y1, x2, y2);

end

function threeEraseGame:playSwapBlock( x1, y1, x2, y2, callback )

	-- body
	local index1 = self.blocks:getIndexByPos(x1, y1);
	local index2 = self.blocks:getIndexByPos(x2, y2);

	local block1 = self.blockInstance[index1]:GetComponent(RectTransform:GetClassType());
	local block2 = self.blockInstance[index2]:GetComponent(RectTransform:GetClassType());

	coroutine.start(self.doMoveBlock, self, block1, block1.anchoredPosition, block2.anchoredPosition, 0.3, callback);

	coroutine.start(self.doMoveBlock, self, block2, block2.anchoredPosition, block1.anchoredPosition, 0.3, nil);


	self.blockInstance[index1] = block2;
	self.blockInstance[index2] = block1;
end



function threeEraseGame:playDropDown(poslist, movelist)
	
	print("playDropDown");
	--print("before erase and gen");
	--self.blocks:printBlocks(poslist);

	self.blocks:eraseAndGen(poslist);
	
	--print("after erase and gen");
	--self.blocks:printBlocks(poslist);

	--refresh new data
	local data = self.blocks:getdata();
	local w = self.blocks:getWidth();
	local h = self.blocks:getHeight();

	for y=1, h do 
		for x=1, w do

			local k = self.blocks:getIndexByPos(x, y);
			local blockType = data[x][y];

			local instance = self.blockInstance[k];

			-- color
			local image = instance:GetComponent(Image.GetClassType());
			--print(image.color);
			image.color = colorMap[blockType];
			--print("refresh data "..x.." "..y);
			--print(image.color);
		end
	end
	

	for k,v in ipairs(movelist) do
		local blockkey = self.blocks:getIndexByPos(v.x, v.y);
		local instance = self.blockInstance[blockkey];
		local rect = instance:GetComponent(RectTransform.GetClassType());

		local height = rect.sizeDelta.y;

		local movestart = Vector2.New(rect.anchoredPosition.x, rect.anchoredPosition.y + height * v.move);
		local moveend = rect.anchoredPosition;

		if k == table.maxn(movelist) then
			
			coroutine.start(self.doMoveBlock, self, rect, movestart, moveend, 0.3, function()

				-- body
				local poslist1, movelist1 = self.blocks:checkThree();
				
				self:handleErase(poslist1, movelist1);

			end);

		else
			
			coroutine.start(self.doMoveBlock, self, rect, movestart, moveend, 0.3);

		end

		--[[
		local height = window:GetHeight();
		local action = LORD.GUIAction:new();
		action:addKeyFrame(LORD.Vector3(0, -height.offset*v.move, 0), LORD.Vector3(0, 0, 0), LORD.Vector3(1, 1, 1), 1, 0);
		action:addKeyFrame(LORD.Vector3(0, 0, 0), LORD.Vector3(0, 0, 0), LORD.Vector3(1, 1, 1), 1, 500);
		window:playAction(action);	
		]]
		

	end

end


function threeEraseGame:handleErase(poslist, movelist)
		
	if poslist then

		function dropNewBlock( )
			-- body

			self:playDropDown(poslist, movelist);

		end

		-- 消除的设置空图，播个特效
		local num = table.maxn(poslist);

		for k,v in ipairs(poslist) do
			local blockkey = self.blocks:getIndexByPos(v.x, v.y);
			local block = self.blockInstance[blockkey];
			
			if k == num then
				coroutine.start(self.doChangeAlpha, self, block, 1, dropNewBlock);
			else
				coroutine.start(self.doChangeAlpha, self, block, 1);			
			end

		end
		

		-- todo
		--[[
		delayCallFunction(function() 
			
			self:playDropDown(poslist, movelist);
			
			delayCallFunction(function() 
				local poslist1, movelist1 = self.blocks:checkThree();
				
				self:handleErase(poslist1, movelist1);
				
			end, 0.5);
			
		end, 0.5);
		]]

	
	else
		
		--print("handleErase -------- over");
		-- 播放结束
		self.moveBlockLocked = false;
		
	end
	
end


function threeEraseGame:swapBlocks(x1, y1, x2, y2)

	self.blocks:swap(x1, y1, x2, y2);

	self:playSwapBlock(x1, y1, x2, y2, function ()
		-- body
		--print("move1 end");

		local poslist, movelist = self.blocks:checkThree();
		
		if poslist then
			
			self:handleErase(poslist, movelist);		

		else
			-- 交换回去
			self:playSwapBlock(x1, y1, x2, y2);
			self.blocks:swap(x1, y1, x2, y2);
			
		end

	end);


end

function threeEraseGame:doMoveBlock( block, position1, position2, time, callback )

	--print("doMoveBlock    --------------------------");

	-- body
	local wholetime = time;
	local remainTime = time;

	while remainTime > 0 do

		remainTime = remainTime - Time.deltaTime;

		coroutine.step();

		local pos = position1 + (position2 - position1) * (1 - remainTime / wholetime);
		block.anchoredPosition = pos;

	end

	block.anchoredPosition = position2;
	
	--print("doMoveBlock   end ");

	if callback then
		callback();
	end

end

function threeEraseGame:doChangeAlpha( block, time, callback )
	-- body
	local image = block:GetComponent(Image.GetClassType());
		-- body
	local wholetime = time;
	local remainTime = time;

	while remainTime > 0 do

		remainTime = remainTime - Time.deltaTime;

		coroutine.step();

		local alpha = 1 + (-1) * (1 - remainTime / wholetime);
		local color = image.color;
		color.a = alpha;
		image.color = color;
	end

		local color = image.color;
		color.a = 0;
		image.color = color;
	
	--print("doChangeAlpha   end ");

	if callback then
		callback();
	end
end

