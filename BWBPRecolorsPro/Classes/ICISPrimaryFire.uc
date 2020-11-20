//=============================================================================
// ICISPrimaryFire.
//
// Self injection with the stimulant pack
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class ICISPrimaryFire extends BallisticFire;

const BASE_HEAL = 2;
const TICKS_PER_RAMP = 2;

// Check if there is ammo in clip if we use weapon's mag or is there some in inventory if we don't
simulated function bool AllowFire()
{
	if (!CheckReloading())
		return false;		// Is weapon busy reloading
	if (!CheckWeaponMode())
		return false;		// Will weapon mode allow further firing

	return Weapon.AmmoAmount(ThisModeNum) > 0;
}

simulated function DoFireEffect()
{
    BallisticPawn(Instigator).GiveAttributedHealth(BASE_HEAL + FireCount / TICKS_PER_RAMP, BallisticPawn(Instigator).HealthMax, Instigator);
}

defaultproperties
{
     BallisticFireSound=(Sound=SoundGroup'BallisticSounds_25.X4.X4_Melee',Radius=4.000000,bAtten=True)
     bAISilent=True
     EffectString="Heals over time."
     PreFireTime=0.65
     PreFireAnim="PrepHealLoop"
     FireLoopAnim="HealLoopA"
     FireEndAnim="HealLoopEnd"
     FireRate=0.35
     AmmoClass=Class'BWBPRecolorsPro.Ammo_ICISStim'
     AmmoPerFire=1
     ShakeRotMag=(X=32.000000,Y=8.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=1.500000
     ShakeOffsetMag=(X=-3.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=1.500000
}
