#ifndef MYCUSTOM_HLSL
#define MYCUSTOM_HLSL

void MyFnc_float(out float3 Out)
{
    Out = float3(1, 0, 0);
}

void Val_float(out float3 Out)
{
    Out = float3(0,1,0);
}

void MyRoll_float(out float3 Out)
{
    Out = float3(0,0, 1);
}
#endif
