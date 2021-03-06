//=============================================================================
// BOGPPrimaryFire.
//
// Fires either an explode on impact grenade, or a burning hot flare to set players ablaze!
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class BOGPPrimaryFire extends BallisticProProjectileFire;

var() BUtil.FullSound			FlareFireSound;

simulated event ModeDoFire()
{
	if (!AllowFire())
		return;
	if (!BOGPPistol(BW).CheckGrenade())
		return;
	Super.ModeDoFire();
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	Proj = Spawn (ProjectileClass,,, Start, Dir);

	if (Proj != None)
		Proj.Instigator = Instigator;
}

function PlayFiring()
{
	BOGPPistol(Weapon).bHideHead = true;

	Super.PlayFiring();
}

defaultproperties
{
     bCockAfterFire=True
     bUseWeaponMag=False
     FlashBone="Muzzle"
     bTossed=True
     bModeExclusive=False
     FireForce="AssaultRifleAltFire"
     AmmoClass=Class'BallisticProV55.Ammo_BOGPGrenades'
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-20.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=2.000000
     BotRefireRate=0.300000
}
