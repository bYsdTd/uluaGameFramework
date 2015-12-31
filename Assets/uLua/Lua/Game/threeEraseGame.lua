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

	---[[	
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
				print("On Click "..index);

			end);

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

	--]]


end
