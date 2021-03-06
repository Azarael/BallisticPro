//=============================================================================
// MARSPrimaryFire.
//
// Very automatic, bullet style instant hit. Shots have medium range and good
// power. Accuracy and ammo goes quickly with its faster than normal rate of fire.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class MARSPrimaryFire extends BallisticRangeAttenFire;

defaultproperties
{
     CutOffDistance=8144.000000
     CutOffStartRange=2536.000000
     TraceRange=(Min=15000.000000,Max=15000.000000)
     WallPenetrationForce=16.000000
     
     Damage=20.000000
     
     
     RangeAtten=0.350000
	 
     DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
     DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
     DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
     PenetrateForce=150
     DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.700000)
     bCockAfterEmpty=True
     MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
     FlashScaleFactor=0.500000
     BrassClass=Class'BallisticProV55.Brass_MG'
     BrassOffset=(X=-80.000000,Y=1.000000)
     FireRecoil=120.000000
     FireChaos=0.032000
     FireChaosCurve=(Points=((InVal=0,OutVal=1),(InVal=0.160000,OutVal=1),(InVal=0.250000,OutVal=1.500000),(InVal=0.500000,OutVal=2.250000),(InVal=0.750000,OutVal=3.500000),(InVal=1.000000,OutVal=5.000000)))
     BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-RapidFire',Volume=1.100000,Slot=SLOT_Interact,bNoOverride=False)
     bPawnRapidFireAnim=True
     FireEndAnim=
     FireRate=0.08
     AmmoClass=Class'BWBP_SKC_Pro.Ammo_545mmSTANAG'
     ShakeRotMag=(X=128.000000,Y=64.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-20.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     WarnTargetPct=0.200000
     aimerror=900.000000
	 BurstFireRateFactor=0.55
}
