class MX32PrimaryFire extends BallisticRangeAttenFire;

defaultproperties
{
     CutOffDistance=8192.000000
     CutOffStartRange=4096.000000
     TraceRange=(Min=12000.000000,Max=15000.000000)
     WallPenetrationForce=1.000000
     
     Damage=23.000000
     RangeAtten=0.350000
     WaterRangeAtten=0.800000
     DamageType=Class'BWBP_OP_Pro.DTMX32Primary'
     DamageTypeHead=Class'BWBP_OP_Pro.DTMX32PrimaryHead'
     DamageTypeArm=Class'BWBP_OP_Pro.DTMX32PrimaryLimb'
     PenetrateForce=150
     bPenetrate=True
     DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.700000)
     bCockAfterEmpty=True
     MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
     FlashScaleFactor=0.300000
     BrassClass=Class'BallisticProV55.Brass_Rifle'
     BrassBone="tip"
     BrassOffset=(X=-80.000000,Y=1.000000)
     AimedFireAnim="SightFire"
     FireChaos=0.03
     FireChaosCurve=(Points=((InVal=0,OutVal=1),(InVal=0.160000,OutVal=1),(InVal=0.250000,OutVal=1.500000),(InVal=0.500000,OutVal=2.250000),(InVal=0.750000,OutVal=3.500000),(InVal=1.000000,OutVal=5.000000)))
     XInaccuracy=32.000000
     YInaccuracy=32.000000
     BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.M51.M51-Fire444',Volume=1.800000,Slot=SLOT_Interact,bNoOverride=False)
     bPawnRapidFireAnim=True
	 FireRecoil=128
     FireEndAnim=
     FireRate=0.113000
     AmmoClass=Class'BWBP_OP_Pro.Ammo_MX32Bullets'
     ShakeRotMag=(X=128.000000,Y=64.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-20.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     WarnTargetPct=0.200000
     aimerror=600.000000
}
