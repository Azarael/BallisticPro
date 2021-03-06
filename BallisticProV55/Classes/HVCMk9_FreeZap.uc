//=============================================================================
// HVCMk9_FreeZap.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class HVCMk9_FreeZap extends BallisticEmitter;

event PostBeginPlay()
{
	super.PostBeginPlay();
	settimer (0.1,true);
}
event Timer()
{
	local vector End, X,Y,Z;

	GetAxes(Rotation, X,Y,Z);
	End = X * 2;
	BeamEmitter(Emitters[1]).StartVelocityRange = VtoRV(End, End);
	BeamEmitter(Emitters[1]).StartVelocityRange.X.Min -= 4 * Abs(X.Z);
	BeamEmitter(Emitters[1]).StartVelocityRange.X.Max += 4 * Abs(X.Z);
	BeamEmitter(Emitters[1]).StartVelocityRange.Y.Min -= 4 * Abs(X.X);
	BeamEmitter(Emitters[1]).StartVelocityRange.Y.Max += 4 * Abs(X.X);
	BeamEmitter(Emitters[1]).StartVelocityRange.Z.Min -= 4 * (1-Abs(X.Z));
	BeamEmitter(Emitters[1]).StartVelocityRange.Z.Max += 4 * (1-Abs(X.Z));
}

defaultproperties
{
     Begin Object Class=BeamEmitter Name=BeamEmitter0
         BeamDistanceRange=(Min=1000.000000,Max=1000.000000)
         BeamEndPoints(0)=(offset=(X=(Min=1000.000000,Max=1000.000000),Y=(Min=-500.000000,Max=500.000000),Z=(Min=-500.000000,Max=500.000000)))
         DetermineEndPointBy=PTEP_TraceOffset
         BeamTextureUScale=4.000000
         RotatingSheets=2
         LowFrequencyNoiseRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-100.000000,Max=100.000000))
         HighFrequencyNoiseRange=(X=(Min=-15.000000,Max=15.000000),Y=(Min=-15.000000,Max=15.000000),Z=(Min=-15.000000,Max=15.000000))
         NoiseDeterminesEndPoint=True
         UseBranching=True
         BranchProbability=(Min=0.200000,Max=0.800000)
         BranchEmitter=1
         BranchSpawnAmountRange=(Min=1.000000,Max=1.000000)
         UseColorScale=True
         FadeOut=True
         UseSizeScale=True
         UseRegularSizeScale=False
         ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
         ColorScale(1)=(RelativeTime=0.685714,Color=(B=255,G=128,R=32,A=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=255,G=128,A=255))
         ColorMultiplierRange=(X=(Min=0.800000),Y=(Min=0.900000))
         FadeOutStartTime=0.088000
         MaxParticles=8
         StartLocationOffset=(X=4.000000)
         SizeScale(1)=(RelativeTime=0.370000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.000000)
         StartSizeRange=(X=(Min=8.000000,Max=8.000000),Y=(Min=8.000000,Max=8.000000),Z=(Min=8.000000,Max=8.000000))
         Texture=Texture'EpicParticles.Beams.HotBolt03aw'
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=0.200000,Max=0.200000)
         StartVelocityRange=(X=(Min=5.000000,Max=5.000000),Y=(Min=-2.000000,Max=2.000000),Z=(Min=-2.000000,Max=2.000000))
     End Object
     Emitters(0)=BeamEmitter'BallisticProV55.HVCMk9_FreeZap.BeamEmitter0'

     Begin Object Class=BeamEmitter Name=BeamEmitter2
         BeamDistanceRange=(Min=300.000000,Max=500.000000)
         DetermineEndPointBy=PTEP_Distance
         LowFrequencyNoiseRange=(X=(Min=-100.000000,Max=100.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-100.000000,Max=100.000000))
         HighFrequencyNoiseRange=(X=(Min=-20.000000,Max=20.000000),Y=(Min=-20.000000,Max=20.000000),Z=(Min=-20.000000,Max=20.000000))
         UseColorScale=True
         FadeOut=True
         FadeIn=True
         RespawnDeadParticles=False
         AutomaticInitialSpawning=False
         ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
         ColorScale(1)=(RelativeTime=0.607143,Color=(B=255,G=128,R=32,A=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=255,G=128,A=255))
         FadeOutStartTime=0.072000
         FadeInEndTime=0.034000
         MaxParticles=20
         StartSizeRange=(X=(Min=8.000000,Max=8.000000),Y=(Min=8.000000,Max=8.000000),Z=(Min=8.000000,Max=8.000000))
         Texture=Texture'EpicParticles.Beams.HotBolt04aw'
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=0.200000,Max=0.200000)
         StartVelocityRange=(X=(Min=2.000000,Max=4.000000),Y=(Min=-4.000000,Max=4.000000),Z=(Min=-4.000000,Max=4.000000))
     End Object
     Emitters(1)=BeamEmitter'BallisticProV55.HVCMk9_FreeZap.BeamEmitter2'

     Begin Object Class=BeamEmitter Name=BeamEmitter1
         BeamDistanceRange=(Min=500.000000,Max=500.000000)
         BeamEndPoints(0)=(offset=(X=(Min=1000.000000,Max=1000.000000),Y=(Min=-100.000000,Max=100.000000),Z=(Min=-100.000000,Max=100.000000)))
         DetermineEndPointBy=PTEP_TraceOffset
         BeamTextureUScale=4.000000
         LowFrequencyNoiseRange=(X=(Min=-50.000000,Max=50.000000),Y=(Min=-50.000000,Max=50.000000),Z=(Min=-50.000000,Max=50.000000))
         HighFrequencyNoiseRange=(X=(Min=-10.000000,Max=10.000000),Y=(Min=-10.000000,Max=10.000000),Z=(Min=-10.000000,Max=10.000000))
         HighFrequencyPoints=8
         NoiseDeterminesEndPoint=True
         UseColorScale=True
         FadeOut=True
         UseSizeScale=True
         UseRegularSizeScale=False
         ColorScale(0)=(Color=(B=255,G=255,R=255,A=255))
         ColorScale(1)=(RelativeTime=0.332143,Color=(B=255,G=192,R=128,A=255))
         ColorScale(2)=(RelativeTime=1.000000,Color=(B=255,A=255))
         FadeOutStartTime=0.072000
         MaxParticles=3
         DetailMode=DM_SuperHigh
         SizeScale(0)=(RelativeSize=2.000000)
         SizeScale(1)=(RelativeTime=0.280000,RelativeSize=1.000000)
         SizeScale(2)=(RelativeTime=1.000000,RelativeSize=1.000000)
         StartSizeRange=(X=(Min=25.000000,Max=30.000000),Y=(Min=25.000000,Max=30.000000),Z=(Min=25.000000,Max=30.000000))
         Texture=Texture'EpicParticles.Beams.IonLightning'
         SecondsBeforeInactive=0.000000
         LifetimeRange=(Min=0.300000,Max=0.300000)
     End Object
     Emitters(2)=BeamEmitter'BallisticProV55.HVCMk9_FreeZap.BeamEmitter1'

}
