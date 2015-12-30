using UnityEngine;
using System.Collections;

public class uiManager : MonoBehaviour {

	GameObject uiRoot;
	GameObject canvas;

	// Use this for initialization
	public void Init() {

		Debug.Log("uiManager Start");

		GameObject ui = Resources.Load<GameObject>("ui/UI");
		uiRoot = GameObject.Instantiate(ui);

		uiRoot.transform.SetParent(gameObject.transform);

		Canvas canvasCom = uiRoot.GetComponentInChildren<Canvas>();
		canvas = canvasCom.gameObject;

//		GameObject block = Resources.Load<GameObject>("ui/block");
//
//		for(int i = 0; i < 3; ++i)
//		{
//			GameObject b = GameObject.Instantiate(block);
//			b.transform.SetParent(canvas.transform, false);
//		}
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
