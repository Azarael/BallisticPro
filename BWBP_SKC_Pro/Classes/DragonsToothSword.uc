//=============================================================================
// DragonsToothSword.
//
// A very large and powerful sword capable of one hit kills.
// It is incredibly strong but attacks slower than all other melee weapons.
// Has a secondary lunge capable of extreme damage.
//
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class DragonsToothSword extends BallisticMeleeWeapon;

var Actor	BladeGlow;				// Nano replicators
var Sound	LoopAmbientSound;

simulated function BringUp(optional Weapon PrevWeapon)
{
	Super.BringUp(PrevWeapon);

	if ((Instigator.PlayerReplicationInfo != None) && (Instigator.PlayerReplicationInfo.Team != None) )
	{
		if ( Instigator.PlayerReplicationInfo.Team.TeamIndex == 0 && Level.Game.bTeamGame )
		{
			Skins[1] = Shader'BWBP_SKC_Tex.DragonToothSword.DTS-Red';
			if (ThirdPersonActor != None)
				DragonsToothAttachment(ThirdPersonActor).bRedTeam=true;	
		}
	}

	Instigator.AmbientSound = LoopAmbientSound;
	Instigator.SoundVolume = 255;
	Instigator.SoundPitch = 48;
	Instigator.SoundRadius = 128;
	Instigator.bFullVolume = true;
}

simulated function bool PutDown()
{
	if (super.PutDown())
	{
		if (BladeGlow != None)	
			BladeGlow.Destroy();

		Instigator.AmbientSound = None;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;

		return true;
	}
	return false;
}

simulated function Destroyed()
{
	if (BladeGlow != None)	
		BladeGlow.Destroy();

	if (Instigator.AmbientSound != None)
	{
		Instigator.AmbientSound = None;
		Instigator.SoundVolume = Instigator.default.SoundVolume;
		Instigator.SoundPitch = Instigator.default.SoundPitch;
		Instigator.SoundRadius = Instigator.default.SoundRadius;
		Instigator.bFullVolume = Instigator.default.bFullVolume;
	}

	super.Destroyed();
}


simulated function BladeEffectStart()
{
	if ((Instigator.PlayerReplicationInfo != None) )
	{
		if ( Instigator.PlayerReplicationInfo.Team.TeamIndex == 0 )
			class'bUtil'.static.InitMuzzleFlash(BladeGlow, class'DragonsToothBladeEffectR', DrawScale, self, 'BladeBase');
		else
			class'bUtil'.static.InitMuzzleFlash(BladeGlow, class'DragonsToothBladeEffect', DrawScale, self, 'BladeBase');
	}
	else
		class'bUtil'.static.InitMuzzleFlash(BladeGlow, class'DragonsToothBladeEffect', DrawScale, self, 'BladeBase');

}

// AI Interface =====
function bool CanAttack(Actor Other)
{
	return true;
}

// choose between regular or alt-fire
function byte BestMode()
{
	local Bot B;
	local float Result;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return 0;

	if (VSize(B.Enemy.Location - Instigator.Location) > FireMode[0].MaxRange()*1.5)
		return 1;
	Result = FRand();
	if (vector(B.Enemy.Rotation) dot Normal(Instigator.Location - B.Enemy.Location) < 0.0)
		Result += 0.3;
	else
		Result -= 0.3;

	if (Result > 0.5)
		return 1;
	return 0;
}

// tells bot whether to charge or back off while using this weapon
function float SuggestAttackStyle()
{
	return 1;
}

// tells bot whether to charge or back off while defending against this weapon
function float SuggestDefenseStyle()
{
	return -1;
}
// End AI Stuff =====

defaultproperties
{
	//LoopAmbientSound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Loop'
	LoopAmbientSound=Sound'GeneralAmbience.texture21'
	TeamSkins(0)=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny')
	BigIconMaterial=Texture'BWBP_SKC_Tex.DragonToothSword.BigIcon_DTS'
	BigIconCoords=(Y1=40,Y2=240)
	BCRepClass=Class'BallisticProV55.BallisticReplicationInfo'
	ManualLines(0)="Strikes once for fatal damage. Has a good range but a very slow swing rate."
	ManualLines(1)="Strikes twice consecutively for good damage. Good for baiting block."
	ManualLines(2)="The Weapon Function key allows the Nanoblade to block incoming frontal melee attacks.||Devastating at close range."
	SpecialInfo(0)=(Info="420.0;20.0;-999.0;-1.0;-999.0;0.9;-999.0")
	BringUpSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Draw',Volume=16.100000)
	bNoMag=True
	GunLength=0.000000
	bAimDisabled=True
	ParamsClasses(0)=Class'DragonsToothWeaponParams'
	FireModeClass(0)=Class'BWBP_SKC_Pro.DragonsToothPrimaryFire'
	FireModeClass(1)=Class'BWBP_SKC_Pro.DragonsToothSecondaryFire'
	SelectAnim="PulloutFancy"
	SelectAnimRate=1.250000
	PutDownTime=0.500000
	BringUpTime=0.700000
	SelectForce="SwitchToAssaultRifle"
	BlockIdleAnim="BlockIdle"	
	AIRating=0.800000
	CurrentRating=0.800000
	bMeleeWeapon=True
	Description="The Dragon Nanoblade is a technological marvel. A weapon consisting of a nanotechnologically created blade which is dynamically 'forged' on command into a non-eutactic solid. Nanoscale whetting devices ensure that the blade is both unbreakable and lethally sharp. The true weapon of a modern warrior."
	DisplayFOV=65.000000
	Priority=12
	HudColor=(B=255,G=125,R=75)
	CenteredOffsetY=7.000000
	CenteredRoll=0
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	GroupOffset=5
	PickupClass=Class'BWBP_SKC_Pro.DragonsToothPickup'
	BobDamping=1.000000
	AttachmentClass=Class'BWBP_SKC_Pro.DragonsToothAttachment'
	IconMaterial=Texture'BWBP_SKC_Tex.DragonToothSword.SmallIcon_DTS'
	IconCoords=(X2=127,Y2=31)
	ItemName="XM300 Dragon Nanoblade"
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FPm_DTS'
	DrawScale=1.250000
	SoundRadius=32.000000
}
