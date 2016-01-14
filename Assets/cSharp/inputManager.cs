using UnityEngine;
using System.Collections;

public class inputManager : MonoBehaviour {

	public void Init ()
	{

	}

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () 
	{
		foreach(Touch touch in Input.touches)
		{
			Debug.Log(touch.fingerId);
			Debug.Log(touch.phase);
			Debug.Log(touch.deltaPosition);
		}

		if(Input.GetMouseButtonDown(0))
		{
			//Debug.Log("button down");

			//Camera camera = GameObject.Find("Camera").GetComponent<Camera>();
			//Ray ray = camera.ScreenPointToRay(Input.mousePosition);
			//bool hit = Physics.Raycast(ray);

			//Debug.Log("hit " + hit.ToString());
			LuaScriptMgr.Instance.CallLuaFunction("HandleTouchDown", Input.mousePosition.x, Input.mousePosition.y);
		}

		if(Input.GetMouseButton(0))
		{
			//Debug.Log("MouseButton ");
			//if(Input.GetMouseButtonDown(0))
			{
				LuaScriptMgr.Instance.CallLuaFunction("HandleTouchMove", Input.mousePosition.x, Input.mousePosition.y);
			}
		}

		if(Input.GetMouseButtonUp(0))
		{
			//Debug.Log("button up");

			LuaScriptMgr.Instance.CallLuaFunction("HandleTouchUp", Input.mousePosition.x, Input.mousePosition.y);
		}

	}
}
