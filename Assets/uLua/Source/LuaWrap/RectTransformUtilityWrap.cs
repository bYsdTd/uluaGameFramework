using System;
using UnityEngine;
using LuaInterface;

public class RectTransformUtilityWrap
{
	public static void Register(IntPtr L)
	{
		LuaMethod[] regs = new LuaMethod[]
		{
			new LuaMethod("RectangleContainsScreenPoint", RectangleContainsScreenPoint),
			new LuaMethod("PixelAdjustPoint", PixelAdjustPoint),
			new LuaMethod("PixelAdjustRect", PixelAdjustRect),
			new LuaMethod("ScreenPointToWorldPointInRectangle", ScreenPointToWorldPointInRectangle),
			new LuaMethod("ScreenPointToLocalPointInRectangle", ScreenPointToLocalPointInRectangle),
			new LuaMethod("ScreenPointToRay", ScreenPointToRay),
			new LuaMethod("WorldToScreenPoint", WorldToScreenPoint),
			new LuaMethod("CalculateRelativeRectTransformBounds", CalculateRelativeRectTransformBounds),
			new LuaMethod("FlipLayoutOnAxis", FlipLayoutOnAxis),
			new LuaMethod("FlipLayoutAxes", FlipLayoutAxes),
			new LuaMethod("New", _CreateRectTransformUtility),
			new LuaMethod("GetClassType", GetClassType),
		};

		LuaField[] fields = new LuaField[]
		{
		};

		LuaScriptMgr.RegisterLib(L, "UnityEngine.RectTransformUtility", typeof(RectTransformUtility), regs, fields, typeof(object));
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreateRectTransformUtility(IntPtr L)
	{
		LuaDLL.luaL_error(L, "RectTransformUtility class does not have a constructor function");
		return 0;
	}

	static Type classType = typeof(RectTransformUtility);

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetClassType(IntPtr L)
	{
		LuaScriptMgr.Push(L, classType);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int RectangleContainsScreenPoint(IntPtr L)
	{
		int count = LuaDLL.lua_gettop(L);

		if (count == 2)
		{
			RectTransform arg0 = (RectTransform)LuaScriptMgr.GetUnityObject(L, 1, typeof(RectTransform));
			Vector2 arg1 = LuaScriptMgr.GetVector2(L, 2);
			bool o = RectTransformUtility.RectangleContainsScreenPoint(arg0,arg1);
			LuaScriptMgr.Push(L, o);
			return 1;
		}
		else if (count == 3)
		{
			RectTransform arg0 = (RectTransform)LuaScriptMgr.GetUnityObject(L, 1, typeof(RectTransform));
			Vector2 arg1 = LuaScriptMgr.GetVector2(L, 2);
			Camera arg2 = (Camera)LuaScriptMgr.GetUnityObject(L, 3, typeof(Camera));
			bool o = RectTransformUtility.RectangleContainsScreenPoint(arg0,arg1,arg2);
			LuaScriptMgr.Push(L, o);
			return 1;
		}
		else
		{
			LuaDLL.luaL_error(L, "invalid arguments to method: RectTransformUtility.RectangleContainsScreenPoint");
		}

		return 0;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PixelAdjustPoint(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 3);
		Vector2 arg0 = LuaScriptMgr.GetVector2(L, 1);
		Transform arg1 = (Transform)LuaScriptMgr.GetUnityObject(L, 2, typeof(Transform));
		Canvas arg2 = (Canvas)LuaScriptMgr.GetUnityObject(L, 3, typeof(Canvas));
		Vector2 o = RectTransformUtility.PixelAdjustPoint(arg0,arg1,arg2);
		LuaScriptMgr.Push(L, o);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int PixelAdjustRect(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 2);
		RectTransform arg0 = (RectTransform)LuaScriptMgr.GetUnityObject(L, 1, typeof(RectTransform));
		Canvas arg1 = (Canvas)LuaScriptMgr.GetUnityObject(L, 2, typeof(Canvas));
		Rect o = RectTransformUtility.PixelAdjustRect(arg0,arg1);
		LuaScriptMgr.PushValue(L, o);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ScreenPointToWorldPointInRectangle(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 4);
		RectTransform arg0 = (RectTransform)LuaScriptMgr.GetUnityObject(L, 1, typeof(RectTransform));
		Vector2 arg1 = LuaScriptMgr.GetVector2(L, 2);
		Camera arg2 = (Camera)LuaScriptMgr.GetUnityObject(L, 3, typeof(Camera));
		Vector3 arg3;
		bool o = RectTransformUtility.ScreenPointToWorldPointInRectangle(arg0,arg1,arg2,out arg3);
		LuaScriptMgr.Push(L, o);
		LuaScriptMgr.Push(L, arg3);
		return 2;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ScreenPointToLocalPointInRectangle(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 4);
		RectTransform arg0 = (RectTransform)LuaScriptMgr.GetUnityObject(L, 1, typeof(RectTransform));
		Vector2 arg1 = LuaScriptMgr.GetVector2(L, 2);
		Camera arg2 = (Camera)LuaScriptMgr.GetUnityObject(L, 3, typeof(Camera));
		Vector2 arg3;
		bool o = RectTransformUtility.ScreenPointToLocalPointInRectangle(arg0,arg1,arg2,out arg3);
		LuaScriptMgr.Push(L, o);
		LuaScriptMgr.Push(L, arg3);
		return 2;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int ScreenPointToRay(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 2);
		Camera arg0 = (Camera)LuaScriptMgr.GetUnityObject(L, 1, typeof(Camera));
		Vector2 arg1 = LuaScriptMgr.GetVector2(L, 2);
		Ray o = RectTransformUtility.ScreenPointToRay(arg0,arg1);
		LuaScriptMgr.Push(L, o);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int WorldToScreenPoint(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 2);
		Camera arg0 = (Camera)LuaScriptMgr.GetUnityObject(L, 1, typeof(Camera));
		Vector3 arg1 = LuaScriptMgr.GetVector3(L, 2);
		Vector2 o = RectTransformUtility.WorldToScreenPoint(arg0,arg1);
		LuaScriptMgr.Push(L, o);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int CalculateRelativeRectTransformBounds(IntPtr L)
	{
		int count = LuaDLL.lua_gettop(L);

		if (count == 1)
		{
			Transform arg0 = (Transform)LuaScriptMgr.GetUnityObject(L, 1, typeof(Transform));
			Bounds o = RectTransformUtility.CalculateRelativeRectTransformBounds(arg0);
			LuaScriptMgr.Push(L, o);
			return 1;
		}
		else if (count == 2)
		{
			Transform arg0 = (Transform)LuaScriptMgr.GetUnityObject(L, 1, typeof(Transform));
			Transform arg1 = (Transform)LuaScriptMgr.GetUnityObject(L, 2, typeof(Transform));
			Bounds o = RectTransformUtility.CalculateRelativeRectTransformBounds(arg0,arg1);
			LuaScriptMgr.Push(L, o);
			return 1;
		}
		else
		{
			LuaDLL.luaL_error(L, "invalid arguments to method: RectTransformUtility.CalculateRelativeRectTransformBounds");
		}

		return 0;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FlipLayoutOnAxis(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 4);
		RectTransform arg0 = (RectTransform)LuaScriptMgr.GetUnityObject(L, 1, typeof(RectTransform));
		int arg1 = (int)LuaScriptMgr.GetNumber(L, 2);
		bool arg2 = LuaScriptMgr.GetBoolean(L, 3);
		bool arg3 = LuaScriptMgr.GetBoolean(L, 4);
		RectTransformUtility.FlipLayoutOnAxis(arg0,arg1,arg2,arg3);
		return 0;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int FlipLayoutAxes(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 3);
		RectTransform arg0 = (RectTransform)LuaScriptMgr.GetUnityObject(L, 1, typeof(RectTransform));
		bool arg1 = LuaScriptMgr.GetBoolean(L, 2);
		bool arg2 = LuaScriptMgr.GetBoolean(L, 3);
		RectTransformUtility.FlipLayoutAxes(arg0,arg1,arg2);
		return 0;
	}
}

