//=============================================================================
// BG_FootExplodeAlien.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class BG_FootExplodeAlien extends BW_HitGoreEmitter
	placeable;

defaultproperties
{
     Begin Object Class=SpriteEmitter Name=SpriteEmitter7
         UseCollision=True
         FadeOut=True
         RespawnDeadParticles=False
         SpinParticles=True
         DampRotation=True
         UniformSize=True
         AutomaticInitialSpawning=False
         UseRandomSubdivision=True
         Acceleration=(Z=-600.000000)
         ExtentMultiplier=(X=0.300000,Y=0.300000,Z=0.300000)
         DampingFactorRange=(X=(Min=0.000000,Max=0.000000),Y=(Min=0.000000,Max=0.000000),Z=(Min=0.000000,Max=0.000000))
         ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
         ColorMultiplierRange=(X=(Min=0.600000,Max=0.600000),Y=(Min=0.700000,Max=0.800000),Z=(Min=0.600000,Max=0.600000))
         FadeOutStartTime=3.400000
         SpinsPerSecondRange=(X=(Max=2.000000))
         StartSpinRange=(X=(Max=1.000000))
         StartSizeRange=(X=(Min=2.000000,Max=5.000000),Y=(Min=2.000000,Max=5.000000),Z=(Min=2.000000,Max=5.000000))
         InitialParticlesPerSecond=400.000000
         DrawStyle=PTDS_AlphaBlend
         Texture=Texture'BallisticBloodPro.AlienSprites.Alien-LimbBits'
         TextureUSubdivisions=4
         TextureVSubdivisions=2
         SecondsBeforeInactive=0.000000
         MinSquaredVelocity=1000.000000
         StartVelocityRange=(X=(Min=2.000000,Max=250.000000),Y=(Min=-40.000000,Max=40.000000),Z=(Min=50.000000,Max=200.000000))
     End Object
     Emitters(0)=SpriteEmitter'BallisticProV55.BG_FootExplodeAlien.SpriteEmitter7'

     Begin Object Class=SpriteEmitter Name=SpriteEmitter8
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         SpinParticles=True
         UseSizeScale=True
         UseRegularSizeScale=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=-10.000000)
         ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
         ColorScale(1)=(RelativeTime=1.000000,Color=(B=255,G=255,R=255,A=255))
         ColorMultiplierRange=(X=(Min=0.000000,Max=0.000000),Y=(Min=0.400000,Max=0.800000),Z=(Min=0.000000,Max=0.000000))
         Opacity=0.720000
         FadeOutStartTime=0.690000
         FadeInEndTime=0.120000
         MaxParticles=4
         StartLocationRange=(Y=(Min=-6.000000,Max=6.000000),Z=(Min=-12.000000))
         SpinsPerSecondRange=(X=(Max=0.050000))
         StartSpinRange=(X=(Max=1.000000))
         SizeScale(0)=(RelativeSize=0.200000)
         SizeScale(1)=(RelativeTime=0.170000,RelativeSize=0.700000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.000000)
         StartSizeRange=(X=(Min=10.000000,Max=15.000000),Y=(Min=10.000000,Max=15.000000),Z=(Min=10.000000,Max=15.000000))
         InitialParticlesPerSecond=400.000000
         DrawStyle=PTDS_AlphaBlend
         Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=1.500000,Max=1.500000)
         StartVelocityRange=(X=(Min=-10.000000,Max=40.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=10.000000,Max=60.000000))
         VelocityLossRange=(X=(Min=1.500000,Max=1.500000),Y=(Min=1.500000,Max=1.500000),Z=(Min=3.000000,Max=3.000000))
     End Object
     Emitters(1)=SpriteEmitter'BallisticProV55.BG_FootExplodeAlien.SpriteEmitter8'

     Begin Object Class=TrailEmitter Name=TrailEmitter2
         TrailShadeType=PTTST_PointLife
         MaxPointsPerTrail=15
         DistanceThreshold=8.000000
         PointLifeTime=2.000000
         FadeOut=True
         RespawnDeadParticles=False
         UniformSize=True
         AutomaticInitialSpawning=False
         Acceleration=(Z=-200.000000)
         ColorMultiplierRange=(X=(Min=0.000000,Max=0.000000),Y=(Min=0.500000),Z=(Min=0.000000,Max=0.000000))
         MaxParticles=1
         DetailMode=DM_SuperHigh
         StartLocationOffset=(Z=-5.000000)
         StartSizeRange=(X=(Min=3.000000,Max=8.000000))
         InitialParticlesPerSecond=400.000000
         DrawStyle=PTDS_AlphaBlend
         Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=0.700000,Max=0.700000)
         StartVelocityRange=(X=(Min=150.000000,Max=300.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Max=100.000000))
     End Object
     Emitters(2)=TrailEmitter'BallisticProV55.BG_FootExplodeAlien.TrailEmitter2'

     AutoDestroy=True
}
