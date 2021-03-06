//=============================================================================
// Ammo_MRS138Shells.
//
// 10 gauge shotgun shells for the MRS138
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class Ammo_MRS138Shells extends BallisticAmmo;

defaultproperties
{
     MaxAmmo=36
     InitialAmount=18
     IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIcon_BP1Flash'
     PickupClass=Class'BallisticProV55.AP_MRS138Box'
     IconMaterial=Texture'BW_Core_WeaponTex.ui.RS-AmmoIconPage'
     IconCoords=(X2=63,Y2=63)
     ItemName="10 Gauge MRS138 Shells"
     DrawScale=0.250000
     PrePivot=(Z=30.000000)
}
