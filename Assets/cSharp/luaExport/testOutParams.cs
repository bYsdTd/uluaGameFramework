using UnityEngine;
using System.Collections;

public class testOutParams 
{
	public void GetValue(ref Vector3 value)
	{
		value = new Vector3(1, 1, 1);
	}

	public void GetArrayValues(ref Vector3[] values)
	{	
		int count = values.Length;

		for(int i = 0; i < count; ++i)
		{
			values[i] = Vector3.zero;
		}
	}

}
