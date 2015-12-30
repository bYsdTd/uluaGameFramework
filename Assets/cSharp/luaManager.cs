using UnityEngine;
using System.Collections;
using LuaInterface;

public class luaManager : MonoBehaviour {
	
	// Use this for initialization
	public void Init () {

		Debug.Log("luaManager start");

		LuaScriptMgr luaScriptMgr = new LuaScriptMgr();
		luaScriptMgr.Start ();

	}
	
	// Update is called once per frame
	void Update () {

		if(LuaScriptMgr.Instance != null)
		{
			LuaScriptMgr.Instance.Update();
		}
	}

	void FixedUpdate()
	{
		if(LuaScriptMgr.Instance != null)
		{
			LuaScriptMgr.Instance.FixedUpdate();
		}
	}

	void LateUpdate()
	{
		if(LuaScriptMgr.Instance != null)
		{
			LuaScriptMgr.Instance.LateUpate();
		}
	}
}
