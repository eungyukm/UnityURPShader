Shader "Custom/CustomUnlitColor"
{
    Properties
    {
        [Maincolor] _BaseColor("Base Color", Color) = (1, 1, 1, 1)
        
        _IntegerEX("Integer display name", Integer) = 1
        _IntEx("Int display name", Int) = 1
        
        _FloatEx("Float display name", Float) = 0.5
        _RangeEx("Float with range", Range(0.0, 1.0)) = 0.5
        
        _TextureEx("Texture2D display name", 2D) = "" {}
        
        _TextureArray("Texture2DArray display name", 2DArray) = "" {}
        
        _TextureTArray("Texture3D", 3D) = "" {}
        
        _CubeMap("Cubemap", Cube) = "" {}
        _CubeMapArray("CubeMapArray", CubeArray) = "" {}
        
        _VectorEx("Vector", Vector) = (0.25, 0.5, 0.5, 1)
        
        _ColorEx("Color", Color) = (0.25, 0.5, 0.5, 1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "RenderPipeline" = "UniversalPipeline" }

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            struct Attributes
            {
                float4 positonOS : POSITION;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
            };

            CBUFFER_START(UnityPerMaterial)
                half4 _BaseColor;
            CBUFFER_END

            Varyings vert(Attributes IN)
            {
                Varyings OUT;
                OUT.positionHCS = TransformObjectToHClip(IN.positonOS.xyz);
                return OUT;
            }

            half4 frag(Varyings IN) : SV_Target
            {
                return _BaseColor;
            }
            ENDHLSL
        }
    }
}
