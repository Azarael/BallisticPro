//=============================================================================
// Ammo_XRS10Bullets.
//
// 10mm pistol ammo. Used by the XRS10
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class Ammo_XRS10Bullets extends BallisticAmmo;

defaultproperties
{
     MaxAmmo=180
     InitialAmount=90
     IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIcon_BP1Flash'
     PickupClass=Class'BallisticProV55.AP_XRS10Clip'
     IconMaterial=Texture'BW_Core_WeaponTex.ui.RS-AmmoIconPage'
     IconCoords=(Y1=64,X2=63,Y2=127)
     ItemName=".40 XRS10 Ammo"
}
