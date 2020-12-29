//=============================================================================
// AP_Laser.
//
// 2 20 round chargers for the LS-14
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2007 RuneStorm. All Rights Reserved.
//=============================================================================
class AP_Laser extends BallisticAmmoPickup;

defaultproperties
{
     AmmoAmount=40
     InventoryType=Class'BWBPRecolorsPro.Ammo_Laser'
     PickupMessage="You got 40 LS-14 energy cells."
     PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
     StaticMesh=StaticMesh'BWBP_SKC_Static.LaserCarbine.LS14AmmoPickup'
     CollisionRadius=8.000000
     CollisionHeight=14.000000
}
