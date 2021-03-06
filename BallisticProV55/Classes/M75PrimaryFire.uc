//=============================================================================
// M75PrimaryFire.
//
// Slow, powerful Railgun fire for the M75. Power of the shot varies depending
// on how long the weapon has been left to charge. Charge affects Damage, Kick
// Trail intensity and how far it can fire through walls.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class M75PrimaryFire extends BallisticRailgunFire;

simulated function SendFireEffect(Actor Other, vector HitLocation, vector HitNormal, int Surf, optional vector WaterHitLoc)
{
	M75Attachment(Weapon.ThirdPersonActor).RailPower = 64;
	super.SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
}

defaultproperties
{
     TraceRange=(Min=30000.000000,Max=30000.000000)
     WallPenetrationForce=128.000000
     
	bCockAfterFire=True
	 
     Damage=100.000000
     HeadMult=1.5f
     LimbMult=0.9f
     
     DamageType=Class'BallisticProV55.DTM75Railgun'
     DamageTypeHead=Class'BallisticProV55.DTM75RailgunHead'
     DamageTypeArm=Class'BallisticProV55.DTM75Railgun'
     KickForce=10000
     PenetrateForce=500
     bPenetrate=True
     PDamageFactor=0.700000
     MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
     FlashScaleFactor=0.750000
     BrassClass=Class'BallisticProV55.Brass_Railgun'
     BrassOffset=(X=-33.000000,Y=-4.000000,Z=-4.000000)
     FireRecoil=768.000000
     FirePushbackForce=350.000000
     FireChaos=0.750000
     BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Volume=0.750000,Radius=384.000000)
     FireEndAnim="'"
     FireRate=1.500000
     AmmoClass=Class'BallisticProV55.Ammo_20mmRailgun'
     ShakeRotMag=(X=400.000000,Y=32.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-5.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
	 
	 // AI
	 bInstantHit=True
	 bLeadTarget=False
	 bTossed=False
	 bSplashDamage=False
	 bRecommendSplashDamage=False
	 BotRefireRate=0.3
     WarnTargetPct=0.75
	 
     aimerror=800.000000
}
