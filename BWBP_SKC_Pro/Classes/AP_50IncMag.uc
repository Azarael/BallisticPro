//=============================================================================
// AP_50IncMag.
//
// 50 Rounds of 50 cal incendiary ammo for the FSSG-50 and FG50
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class AP_50IncMag extends BallisticAmmoPickup;

defaultproperties
{
     AmmoAmount=20
     InventoryType=Class'BWBP_SKC_Pro.Ammo_50Inc'
     PickupMessage="You picked up two FSSG-50 magazines."
     PickupSound=Sound'BW_Core_WeaponSound.Ammo.MGBoxPickup'
     StaticMesh=StaticMesh'BWBP_SKC_Static.FSSG50.FSSG50AmmoPickup'
     DrawScale=0.700000
     CollisionRadius=8.000000
     CollisionHeight=5.500000
}
