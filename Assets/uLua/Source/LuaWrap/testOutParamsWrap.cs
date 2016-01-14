using System;
using UnityEngine;
using LuaInterface;

public class testOutParamsWrap
{
	public static void Register(IntPtr L)
	{
		LuaMethod[] regs = new LuaMethod[]
		{
			new LuaMethod("GetValue", GetValue),
			new LuaMethod("GetArrayValues", GetArrayValues),
			new LuaMethod("New", _CreatetestOutParams),
			new LuaMethod("GetClassType", GetClassType),
		};

		LuaField[] fields = new LuaField[]
		{
		};

		LuaScriptMgr.RegisterLib(L, "testOutParams", typeof(testOutParams), regs, fields, typeof(object));
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _CreatetestOutParams(IntPtr L)
	{
		int count = LuaDLL.lua_gettop(L);

		if (count == 0)
		{
			testOutParams obj = new testOutParams();
			LuaScriptMgr.PushObject(L, obj);
			return 1;
		}
		else
		{
			LuaDLL.luaL_error(L, "invalid arguments to method: testOutParams.New");
		}

		return 0;
	}

	static Type classType = typeof(testOutParams);

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetClassType(IntPtr L)
	{
		LuaScriptMgr.Push(L, classType);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetValue(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 2);
		testOutParams obj = (testOutParams)LuaScriptMgr.GetNetObjectSelf(L, 1, "testOutParams");
		Vector3 arg0 = LuaScriptMgr.GetVector3(L, 2);
		obj.GetValue(ref arg0);
		LuaScriptMgr.Push(L, arg0);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int GetArrayValues(IntPtr L)
	{
		LuaScriptMgr.CheckArgsCount(L, 2);
		testOutParams obj = (testOutParams)LuaScriptMgr.GetNetObjectSelf(L, 1, "testOutParams");
		Vector3[] arg0 = (Vector3[])LuaScriptMgr.GetNetObject(L, 2, typeof(Vector3[]));
		obj.GetArrayValues(ref arg0);
		LuaScriptMgr.PushArray(L, arg0);
		return 1;
	}
}

