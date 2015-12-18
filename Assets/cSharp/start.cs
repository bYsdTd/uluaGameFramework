using UnityEngine;
using System.Collections;

public class start : MonoBehaviour {

	// Use this for initialization
	void Start () {

		GameObject go = new GameObject("luaManager");
		go.AddComponent<luaManager>();

		GameObject.DontDestroyOnLoad(go);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
