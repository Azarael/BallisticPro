//=============================================================================
// Ammo_FP9Ammo.
//
// Ammo for the FP9
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class Ammo_FP9Ammo extends BallisticAmmo;

defaultproperties
{
     bNoPackResupply=True
     MaxAmmo=1
     InitialAmount=1
     IconFlashMaterial=Shader'BW_Core_WeaponTex.Icons.AmmoIconsFlashing'
     PickupClass=Class'BallisticProV55.FP9Pickup'
     IconMaterial=Texture'BW_Core_WeaponTex.Icons.AmmoIconPage'
     IconCoords=(X1=64,X2=127,Y2=63)
     ItemName="FP9 Ammo"
}
