//=============================================================================
// AD_A73Stab.
//=============================================================================
class AD_A73Stab extends AD_ImpactDecal
	placeable;

simulated event PostBeginPlay()
{
	local Rotator R;

	R = Rotation;
	R.Roll = 8192 - R.Yaw + Rotator(Owner.Location - Location).Yaw;
	SetRotation (R);

	Super.PostBeginPlay();
}

defaultproperties
{
     bRandomRotate=False
     DrawScaleVariance=0.050000
     ProjTexture=Texture'BW_Core_WeaponTex.Decals.A73BladeCut'
     DrawScale=0.200000
}
