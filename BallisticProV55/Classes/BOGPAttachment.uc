//=============================================================================
// BOGPAttachment.
//
// _TPm person weapon attachment for BOGP Pistol
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyrightę 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class BOGPAttachment extends HandgunAttachment;

defaultproperties
{
     MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
     FlashScale=0.650000
     BrassMode=MU_None
     InstantMode=MU_None
     WaterTracerMode=MU_None
     bHeavy=True
     Mesh=SkeletalMesh'BW_Core_WeaponAnim.BORT_TPm'
     DrawScale=0.325000
	 CockingAnim="Reload_BreakOpen"
}
