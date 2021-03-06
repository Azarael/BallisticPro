//=============================================================================
// M50SecondaryFire.
//
// A grenade that bonces off walls and detonates a certain time after impact
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class ARSecondaryFire extends BallisticProProjectileFire;

// Check if there is ammo in mag if we use it or is there some in inventory if we don't
simulated function bool AllowFire()
{
	if (!CheckReloading())
		return false;		// Is weapon busy reloading
	if (!CheckWeaponMode())
		return false;		// Will weapon mode allow further firing
	if (ARShotgun(BW).Grenades == 0 && !ARShotgun(BW).bReady)
	{
		if (!bPlayedDryFire && DryFireSound.Sound != None)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound,DryFireSound.Slot,DryFireSound.Volume,DryFireSound.bNoOverride,DryFireSound.Radius,DryFireSound.Pitch,DryFireSound.bAtten);
			bPlayedDryFire=true;
		}
		if (bDryUncock)
			BW.bNeedCock=true;
		BW.bNeedReload = BW.MayNeedReload(ThisModeNum, 0);

		ARShotgun(BW).EmptyAltFire(ThisModeNum);
		return false;		// Is there ammo in weapon's mag
	}
    return true;
}

simulated event ModeDoFire()
{	
	if (!AllowFire())
		return;

	if (!ARShotgun(BW).bReady)
	{
		ARShotgun(BW).PrepAltFire();
		return;
	}
	else
	{
		super.ModeDoFire();
		ARShotgun(BW).bReady = false;
		ARShotgun(BW).PrepPriFire();
	}
}

defaultproperties
{
     SpawnOffset=(X=20.000000,Y=9.000000,Z=-9.000000)
     bUseWeaponMag=False
     MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
     FlashBone="tip2"
     FlashScaleFactor=0.500000
     BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
     BrassOffset=(X=-1.000000,Z=-1.000000)
     FireRecoil=650.000000
     FirePushbackForce=180.000000
     FireChaos=0.450000
     XInaccuracy=384.000000
     YInaccuracy=384.000000
     BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.300000)
     bSplashDamage=True
     bRecommendSplashDamage=True
     bTossed=True
     bModeExclusive=False
     FireAnim="GLFire"
     FireAnimRate=1.250000
     FireForce="GLFire"
     FireRate=0.650000
     AmmoClass=Class'BWBP_OP_Pro.Ammo_ARGrenades'
     AmmoPerFire=0
     ShakeRotMag=(X=128.000000,Y=64.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-30.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     ProjectileClass=Class'BWBP_OP_Pro.ARProjectile'
     BotRefireRate=0.600000
     WarnTargetPct=0.400000
}
