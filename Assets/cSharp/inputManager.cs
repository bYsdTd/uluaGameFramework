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

	}
}
