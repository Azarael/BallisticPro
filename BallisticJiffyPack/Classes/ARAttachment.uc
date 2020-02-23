//=============================================================================
// SK410Attachment.
//
// 3rd person weapon attachment for SK410 Shotgun
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class ARAttachment extends BallisticShotgunAttachment;

defaultproperties
{
     FireClass=Class'BallisticJiffyPack.ARPrimaryFire'
     MuzzleFlashClass=Class'BallisticJiffyPack.ARHeatEmitter'
     ImpactManager=Class'BallisticProV55.IM_Shell'
     MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
     FlashScale=1.800000
     BrassClass=Class'BallisticJiffyPack.Brass_ShotgunHE'
     TracerClass=Class'BallisticJiffyPack.TraceEmitter_ShotgunHE'
     TracerChance=0.500000
     ReloadAnim="Reload_AR"
     ReloadAnimRate=0.900000
     Mesh=SkeletalMesh'BallisticRecolors4AnimPro.SK410Third'
     RelativeRotation=(Pitch=32768)
     DrawScale=0.200000
     PrePivot=(X=1.000000,Z=-5.000000)
}