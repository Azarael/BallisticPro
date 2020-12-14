//=============================================================================
// AP_CX61Mag.
//
// 2 x 40 round clips for the SAR 12.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2007 RuneStorm. All Rights Reserved.
//=============================================================================
class AP_CX61Mag extends BallisticAmmoPickup;

defaultproperties
{
     AmmoAmount=64
     InventoryType=Class'BWBPOtherPackPro.Ammo_CX61Rounds'
     PickupMessage="You picked up two CX61 magazines."
     PickupSound=Sound'BW_Core_WeaponSound.Ammo.ClipPickup'
     StaticMesh=StaticMesh'BWBP_SKC_StaticExp.CX61.CX61AmmoPickup'
     DrawScale=0.550000
     PrePivot=(Z=34.000000)
     CollisionRadius=8.000000
     CollisionHeight=14.000000
}
