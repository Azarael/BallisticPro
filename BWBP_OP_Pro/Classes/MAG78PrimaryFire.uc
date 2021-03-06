//=============================================================================
// EKS43PrimaryFire.
//
// Horizontalish swipe attack for the EKS43. Uses melee swpie system to do
// horizontal swipes. When the swipe traces find a player, the trace closest to
// the aim will be used to do the damage.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class MAG78PrimaryFire extends BallisticMeleeFire;

var() Array<name> SliceAnims;
var int SliceAnim;

simulated event ModeDoFire()
{
	FireAnim = SliceAnims[SliceAnim];
	SliceAnim++;
	if (SliceAnim >= SliceAnims.Length)
		SliceAnim = 0;

	Super.ModeDoFire();
}

simulated function bool HasAmmo()
{
	return true;
}

defaultproperties
{
     SliceAnims(0)="Swing1"
     SliceAnims(1)="Swing2"
     FatiguePerStrike=0.064000
     bCanBackstab=False
     TraceRange=(Min=175.000000,Max=175.000000)
	 Damage=80.000000
     DamageType=Class'BWBP_OP_Pro.DT_MAGSAWStab'
     DamageTypeHead=Class'BWBP_OP_Pro.DT_MAGSAWStabHead'
     DamageTypeArm=Class'BWBP_OP_Pro.DT_MAGSAWStab'
     KickForce=100
     BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.LongSword.SawSwing',Radius=378.000000,bAtten=True,bNoOverride=False)
     bAISilent=True
     FireAnim="Swing1"
     FireRate=0.75
     AmmoClass=Class'Ammo_MAGSAWCharge'
     AmmoPerFire=0
     ShakeRotMag=(X=64.000000,Y=512.000000)
     ShakeRotRate=(X=3000.000000,Y=3000.000000,Z=3000.000000)
     ShakeRotTime=2.500000
     BotRefireRate=0.800000
     WarnTargetPct=0.100000
}
