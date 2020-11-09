//=============================================================================
// MRLRocket.
//
// A Crazy, unpredictable and not too powerful small 'drunk' rocket. They move
// fast and unpredictably, but usually come with lots of others.
//
// Drunkness:
// -Initial low accuracy
// -Duds
// -Strafing
// -Sidewinders
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2007 RuneStorm. All Rights Reserved.
//=============================================================================
class LS14Rocket extends BallisticProjectile;

simulated event Landed( vector HitNormal )
{
	HitWall( HitNormal, Level );
}

defaultproperties
{
     ImpactManager=Class'BallisticProV55.IM_MRLRocket'
     bRandomStartRotaion=False
     TrailClass=Class'BallisticProV55.MRLTrailEmitter'
     TrailOffset=(X=-4.000000)
     MyRadiusDamageType=Class'BWBPRecolorsPro.DT_LS14RocketRadius'
     SplashManager=Class'BallisticProV55.IM_ProjWater'
     Speed=4500.000000
     MaxSpeed=65000.000000
     Damage=100.000000
     DamageRadius=384.000000
     WallPenetrationForce=192
     MomentumTransfer=10000.000000
     MyDamageType=Class'BWBPRecolorsPro.DT_LS14Rocket'
     StaticMesh=StaticMesh'BWBP4-Hardware.MRL.MRLRocket'
     AmbientSound=Sound'BWBP4-Sounds.MRL.MRL-RocketFly'
     SoundVolume=64
     bFixedRotationDir=True
     RotationRate=(Roll=32768)
}
