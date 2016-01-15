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
	
	local blocks = blocks.New();
	blocks:init(9, 9, 6);
	blocks:generate();
	--blocks:test();

	self.blockInstance = {};

	self.touchDownPos = Vector2.New(-1, -1);

	local go = UnityEngine.Resources.Load("ui/block", GameObject.GetClassType());
	local canvas = GameObject.Find("UI(Clone)/Canvas");

	local w = blocks:getWidth();
	local h = blocks:getHeight();

	local data = blocks:getdata();

	local xoffset = 100;
	local yoffset = 100;
	local size = 30;

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

			local index = blocks:getIndexByPos(j, i);

			-- button
			local btn = instance:GetComponent(Button.GetClassType());
			btn.onClick:AddListener(function ()
				-- body
				--print("On Click "..index);

			end);

			self.blockInstance[blocks:getIndexByPos(j,i)] = instance;

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
				print("onTouchDown K"..k);

				self.touchDownPos.x = x;
				self.touchDownPos.y = y;

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

		print("on move angel "..angel);

		if moveDir.x > 0 then
		
			-- right
			if angel >=0 and angel < 45 then
			
			-- up
				print("up");

			elseif angel >= 45 and angel < 135 then
			-- right
				
				print("right");
			else
			-- down
				print("down");
			end

		else
		
			-- left

			if angel >=0 and angel < 45 then
			
			-- up
				print("up");

			elseif angel >= 45 and angel < 135 then
			-- left
				
				print("left");
			else
			-- down
				
				print("down");
			end

		end

	end

end


function  threeEraseGame:onTouchUp( x, y )
	-- body

	self.touchDownPos.x = -1;
	self.touchDownPos.y = -1;
end

function threeEraseGame:swapBlocks(x1, y1, x2, y2)


end
