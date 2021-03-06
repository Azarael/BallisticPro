//=============================================================================
// AP_NovaCrystal.
//
// Pickup for NovaStaff ammo.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2006 RuneStorm. All Rights Reserved.
//=============================================================================
class AP_NovaCrystal extends BallisticAmmoPickup;

var Actor GlowA, GlowB;
var bool bRemove, bSleep;

replication
{
	unreliable if (Role == ROLE_Authority)
		bRemove, bSleep;
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	GlowA = Spawn(class'RSNovaAmmoGlowA', self, , location);
	GlowB = Spawn(class'RSNovaAmmoGlowB', self, , location);
	GlowA.SetBase(self);
	GlowB.SetBase(self);
}

simulated event Destroyed()
{
	if (GlowA!=None)
		GlowA.Destroy();
	if (GlowB!=None)
		GlowB.Destroy();
	super.Destroyed();
}

simulated function PostNetReceive()
{
	if(bSleep)
	{
		if (GlowA!=None)
			GlowA.bHidden=true;
		if (GlowB!=None)
			GlowB.bHidden=true;
	}
	else
	{
		if (!bDeleteMe)
		{
			if (GlowA == None)
			{
				GlowA = Spawn(class'RSNovaAmmoGlowA', self, , location);
				GlowA.SetBase(self);
			}
			else
				GlowA.bHidden=false;
			if (GlowB == None)
			{
				GlowB = Spawn(class'RSNovaAmmoGlowB', self, , location);
				GlowB.SetBase(self);
			}
			else
				GlowB.bHidden=false;
		}
	}
	if(bRemove)
	{
		if (GlowA!=None)
			GlowA.Destroy();
		if (GlowB!=None)
			GlowB.Destroy();
	}
}

State Sleeping
{
	simulated function BeginState()
	{
		if (GlowA!=None)
			GlowA.bHidden=true;
		if (GlowB!=None)
			GlowB.bHidden=true;
		bSleep = true;
		super.BeginState();
	}
	simulated function EndState()
	{
		super.EndState();
		bSleep = false;
		if (!bDeleteMe)
		{
			if (GlowA == None)
			{
				GlowA = Spawn(class'RSNovaAmmoGlowA', self, , location);
				GlowA.SetBase(self);
			}
			else
				GlowA.bHidden=false;
			if (GlowB == None)
			{
				GlowB = Spawn(class'RSNovaAmmoGlowB', self, , location);
				GlowB.SetBase(self);
			}
			else
				GlowB.bHidden=false;
		}
	}
}

State Disabled
{
	simulated function BeginState()
	{
		super.BeginState();
		if (GlowA!=None)
			GlowA.Destroy();
		if (GlowB!=None)
			GlowB.Destroy();
		bRemove = true;
	}
}

defaultproperties
{
     AmmoAmount=21
     InventoryType=Class'BallisticProV55.Ammo_NovaCrystal'
     PickupMessage="You picked up a Nova crystal."
     PickupSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AmmoPickup'
     StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Nova-Ammo'
     DrawScale=2.500000
     CollisionRadius=8.000000
     CollisionHeight=14.200000
}
