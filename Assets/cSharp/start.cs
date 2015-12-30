using UnityEngine;
using System.Collections;
using LuaInterface;

public class start : MonoBehaviour {

	// Use this for initialization
	void Start () {

		Debug.Log("start Start");

		GameObject uigo = new GameObject("uiManager");
		uiManager uimgr = uigo.AddComponent<uiManager>();
		uimgr.Init();

		GameObject.DontDestroyOnLoad(uigo);


		GameObject go = new GameObject("luaManager");
		luaManager luamgr = go.AddComponent<luaManager>();
		luamgr.Init();

		GameObject.DontDestroyOnLoad(go);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
