using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class UpdateShaderProperty : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (gameObject.transform.hasChanged)
        {
            Renderer[] renderers = FindObjectsOfType<Renderer>();
            foreach (var render in renderers)
            {
                Material m;
                #if UNITY_EDITOR
                m = render.sharedMaterial;
                #else
                m = render.material;
                #endif
                
                if (string.Compare(m.shader.name, "Shader Graphs/ToonRamp") == 0)
                {
                    m.SetVector("_LightDir", transform.forward);
                }
            }
        }
    }
}
