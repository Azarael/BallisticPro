//=============================================================================
// CX61 primary fire. Automatic.
//=============================================================================
class CX61PrimaryFire extends BallisticRangeAttenFire;

defaultproperties
{
     CutOffDistance=2560.000000
     CutOffStartRange=1280.000000
     TraceRange=(Min=9000.000000,Max=9000.000000)
     
     WallPenetrationForce=16.000000
     
     Damage=22.000000
     RangeAtten=0.350000
     WaterRangeAtten=0.800000
	 
     DamageType=Class'BWBP_OP_Pro.DT_CX61Chest'
     DamageTypeHead=Class'BWBP_OP_Pro.DT_CX61Head'
     DamageTypeArm=Class'BWBP_OP_Pro.DT_CX61Chest'
     PenetrateForce=180
     bPenetrate=True
     DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.700000)
     MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
     FlashScaleFactor=0.700000
     BrassClass=Class'BallisticProV55.Brass_Rifle'
     BrassBone="tip"
     BrassOffset=(X=-80.000000,Y=1.000000)
     AimedFireAnim="SightFire"
     FireRecoil=128.000000
     FireChaos=0.030000
     FireChaosCurve=(Points=((InVal=0,OutVal=1),(InVal=0.160000,OutVal=1),(InVal=0.250000,OutVal=1.500000),(InVal=0.500000,OutVal=2.250000),(InVal=0.750000,OutVal=3.500000),(InVal=1.000000,OutVal=5.000000)))
     XInaccuracy=48.000000
     YInaccuracy=48.000000
     BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.CX61.CX61-Fire',Slot=SLOT_Interact,bNoOverride=False)
     bPawnRapidFireAnim=True
     FireAnim="SightFire"
     FireEndAnim=
     FireAnimRate=1.200000
     FireRate=0.115000
     AmmoClass=Class'BWBP_OP_Pro.Ammo_CX61Rounds'
     ShakeRotMag=(X=128.000000,Y=64.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-30.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     WarnTargetPct=0.200000
     aimerror=900.000000
}
