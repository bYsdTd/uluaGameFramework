using UnityEngine;
using System.Collections;
using LuaInterface;

public class luaManager : MonoBehaviour {

	private LuaScriptMgr _luaScriptMgr = null;

	// Use this for initialization
	void Start () {

		_luaScriptMgr = new LuaScriptMgr();
		_luaScriptMgr.Start ();

	}
	
	// Update is called once per frame
	void Update () {

		if(_luaScriptMgr != null)
		{
			_luaScriptMgr.Update();
		}
	}

	void FixedUpdate()
	{
		if(_luaScriptMgr != null)
		{
			_luaScriptMgr.FixedUpdate();
		}
	}

	void LateUpdate()
	{
		if(_luaScriptMgr != null)
		{
			_luaScriptMgr.LateUpate();
		}
	}
}
