require("Game.blocks.lua");

threeEraseGame = class("threeEraseGame");

function threeEraseGame:ctor()
	
	print("threeEraseGame  ctor");
	
	---[[
	local blocks = blocks.New();
	blocks:init(9, 9, 6);
	blocks:generate();
	blocks:test();
	--]]

	---[[	
	local go = UnityEngine.Resources.Load("ui/block", GameObject.GetClassType());
	local canvas = GameObject.Find("UI(Clone)/Canvas");

	local w = blocks:getWidth();
	local h = blocks:getHeight();

	local data = blocks:getdata();

	local xoffset = 0;
	local yoffset = 0;
	local size = 30;

	for i=1, h do
		
		xoffset = 0;

		for j=1, w do
					
			--self.data[j] = self.data[j] or {};
			
			--self.data[j][i] = self.data[j][i] or 0;

			local instance = GameObject.Instantiate(go);
			local rect = instance:GetComponent(RectTransform.GetClassType());
			instance.transform:SetParent(canvas.transform, false);

			rect.anchoredPosition = Vector2.New(xoffset, yoffset);
			rect.sizeDelta = Vector2.New(size, size);

			print("anchoredPosition "..tostring(rect.anchoredPosition));
			print("anchorMin "..tostring(rect.anchorMin));
			print("anchorMax "..tostring(rect.anchorMax));
			print("anchoredPosition3D "..tostring(rect.anchoredPosition3D));
			print("sizeDelta "..tostring(rect.sizeDelta));
			print("pivot "..tostring(rect.pivot));
			print("offsetMin "..tostring(rect.offsetMin));
			print("offsetMax "..tostring(rect.offsetMax));

			xoffset = xoffset + size;
		end
		
		yoffset = yoffset + size;
	end

	--]]


end
