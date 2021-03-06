//=============================================================================
// A500Reptile.
//
// An alien acid weapon that fires corrosive projectiles that do extra damage to enemy armor.
// It also fires a large blob of residual corrosive acid.
//
// by Logan "BlackEagle" Richert.
// uses code by Nolan "Dark Carnivour" Richert.
// Copyright� 2011 RuneStorm. All Rights Reserved.
//=============================================================================
class A500Reptile extends BallisticWeapon;

var float CrosshairSpreadAngle;

simulated function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	CrosshairSpreadAngle = A500PrimaryFire(BFireMode[0]).GetCrosshairInaccAngle();
}	

//Draws simple crosshairs to accurately describe hipfire at any FOV and resolution.
simulated function DrawCrosshairs(canvas C)
{
	local float 		ShortBound, LongBound;
	local float 		OffsetAdjustment;
	local Color 		SavedDrawColor;

	// Draw weapon specific Crosshairs
	if (bOldCrosshairs || bScopeView)
		return;

	if ((!bNoMag && MagAmmo == 0)|| bNeedCock)
		SavedDrawColor = MagEmptyColor;
		
	else SavedDrawColor = class'HUD'.default.CrosshairColor;
		
	C.DrawColor = SavedDrawColor;
	
	ShortBound = 2;
	LongBound= 10;
	
	OffsetAdjustment = C.ClipX / 2;
	OffsetAdjustment *= tan (CrosshairSpreadAngle) / tan((Instigator.Controller.FovAngle/2) * 0.01745329252);
	
	//black
	//hor
	C.SetDrawColor(0,0,0,255);
	
	C.SetPos((C.ClipX / 2) - (LongBound + OffsetAdjustment+1), (C.ClipY/2) - (ShortBound/2+1));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', LongBound+2, ShortBound+2);
	
	C.SetPos((C.ClipX / 2) + OffsetAdjustment -1, (C.ClipY/2) - (ShortBound/2+1));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', LongBound+2, ShortBound+2);
	
	//ver
	C.SetPos((C.ClipX / 2) - (ShortBound/2+1), (C.ClipY/2) - (LongBound + OffsetAdjustment+1));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', ShortBound+2, LongBound+2);
	
	C.SetPos((C.ClipX / 2) - (Shortbound/2+1), (C.ClipY/2) + OffsetAdjustment-1);
	C.DrawTileStretched(Texture'Engine.WhiteTexture', ShortBound+2, LongBound+2);
	
	//centre square
	if (bDrawCrosshairDot)
	{
		C.DrawColor.A = 255;
		C.SetPos(C.ClipX / 2 - 2, C.ClipY/2 - 2);
		C.DrawTileStretched(Texture'Engine.WhiteTexture', 4, 4);
	}
	//green
	C.DrawColor = SavedDrawColor;
	//hor
	C.SetPos((C.ClipX / 2) - (LongBound + OffsetAdjustment), (C.ClipY/2) - (ShortBound/2));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', LongBound, ShortBound);
	
	C.SetPos((C.ClipX / 2) + OffsetAdjustment, (C.ClipY/2) - (ShortBound/2));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', LongBound, ShortBound);
	
	//ver
	C.SetPos((C.ClipX / 2) - (ShortBound/2), (C.ClipY/2) - (LongBound + OffsetAdjustment));
	C.DrawTileStretched(Texture'Engine.WhiteTexture', ShortBound, LongBound);
	
	C.SetPos((C.ClipX / 2) - (Shortbound/2), (C.ClipY/2) + OffsetAdjustment);
	C.DrawTileStretched(Texture'Engine.WhiteTexture', ShortBound, LongBound);
	
	//centre square
	if (bDrawCrosshairDot)
	{
		C.DrawColor.A = 255;
		C.SetPos(C.ClipX / 2 - 1, C.ClipY/2 - 1);
		C.DrawTileStretched(Texture'Engine.WhiteTexture', 2, 2);
	}
}


exec simulated function CockGun(optional byte Type);
function ServerCockGun(optional byte Type);

simulated function BringUp(optional Weapon PrevWeapon)
{
	Super.BringUp(PrevWeapon);

	GunLength = default.GunLength;
}

simulated function float RateSelf()
{
	if (PlayerController(Instigator.Controller) != None && Ammo[0].AmmoAmount < 1 && MagAmmo < 1)
		CurrentRating = Super.RateSelf() * 0.2;
	else
		return Super.RateSelf();
	return CurrentRating;
}
// AI Interface =====
// choose between regular or alt-fire
function byte BestMode()
{
	local Bot B;
	local float Dist;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return 0;

	Dist = VSize(B.Enemy.Location - Instigator.Location);

	if (Dist > 2048 || Rand(100) < 10)
		return 1;
	return 0;
}

function float GetAIRating()
{
	local Bot B;
	
	local float Dist;
	local float Rating;

	B = Bot(Instigator.Controller);
	
	if ( B == None )
		return AIRating;

	Rating = Super.GetAIRating();

	if (B.Enemy == None)
		return Rating;

	Dist = VSize(B.Enemy.Location - Instigator.Location);

	return class'BUtil'.static.DistanceAtten(Rating, 0.5, Dist, 1536, 3072); 
}

// tells bot whether to charge or back off while using this weapon
function float SuggestAttackStyle()	{ return 0.8;	}
// tells bot whether to charge or back off while defending against this weapon
function float SuggestDefenseStyle()	{	return -0.8;	}

simulated function float ChargeBar()
{
	return BFireMode[1].HoldTime / BFireMode[1].MaxHoldTime;
}

defaultproperties
{
	TeamSkins(0)=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny')
	BigIconMaterial=Texture'BW_Core_WeaponTex.Reptile.BigIcon_Reptile'
	BigIconCoords=(Y1=30,Y2=230)
	BCRepClass=Class'BallisticProV55.BallisticReplicationInfo'
	bWT_Shotgun=True
	bWT_Hazardous=True
	bWT_Projectile=True
	ManualLines(0)="Blasts the enemy with multiple acid projectiles. These projectiles gain damage over range and inflict a short-duration blind on a headshot. Good shoulder fire properties."
	ManualLines(1)="Charges a larger, direct-attack projectile with minor radius damage. This projectile creates pools of acid where it strikes. Speed, power, number of pools and radius of coverage all increase with charge."
	ManualLines(2)="The A500 is effective at close range, or at all ranges when charged. The recoil is low because of the nature of the delivery system."
	SpecialInfo(0)=(Info="210.0;30.0;0.95;80.0;0.0;0.8;0.8")
	BringUpSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Pullout')
	PutDownSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Putaway')
	MagAmmo=8
	ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_ClipOut',Volume=0.800000)
	ClipInSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_ClipIn',Volume=0.800000)
	ClipInFrame=0.700000
	bNonCocking=True
	WeaponModes(0)=(ModeName="Blast")
	WeaponModes(1)=(bUnavailable=True,Value=4.000000)
	WeaponModes(2)=(bUnavailable=True)
	CurrentWeaponMode=0
    ReloadAnimRate=1.25
	SightPivot=(Pitch=512)
	SightOffset=(X=15.000000,Y=0.100000,Z=35.000000)
	SightDisplayFOV=40.000000
	GunLength=48.000000
	ParamsClasses(0)=Class'A500WeaponParams'
	FireModeClass(0)=Class'BallisticProV55.A500PrimaryFire'
	FireModeClass(1)=Class'BallisticProV55.A500SecondaryFire'
	BringUpTime=0.500000
	SelectForce="SwitchToAssaultRifle"
	AIRating=0.800000
	CurrentRating=0.800000
	bShowChargingBar=True
	Description="The A500 is a mostly experimental Skrith weapon, seen in only a handful of battles fought against Terran forces. The first encounter with Skrith troops using the 'Reptile' was during a notorious incident on one of the Outworld colonies, where UTC troops were stationed in defense of a large Terran lab still operating. The Skrith invaded the area with little warning, and although the heavily armoured Terrans far outnumbered the Skrith incursion party, the A500 was used by the aliens to great effect. The armoured Terrans affected by the acidic substances suffered a painful fate as the armour was eaten away rapidly and then the soldier themselves fell to the toxic substance. Many theorize that the A500 and other recent Skrith weapons are a response to the ineffectiveness of their previous energy weapons against much of the Terran armour."
	DisplayFOV=55.000000
	Priority=39
	HudColor=(G=200,R=150)
	CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
	InventoryGroup=7
	PickupClass=Class'BallisticProV55.A500Pickup'
	PlayerViewOffset=(X=-9.000000,Y=13.000000,Z=-15.000000)
	PlayerViewPivot=(Pitch=600)
	AttachmentClass=Class'BallisticProV55.A500Attachment'
	IconMaterial=Texture'BW_Core_WeaponTex.Reptile.SmallIcon_Reptile'
	IconCoords=(X2=127,Y2=31)
	ItemName="A500 'Reptile' Acid Gun"
	LightType=LT_Pulse
	LightEffect=LE_NonIncidence
	LightHue=54
	LightSaturation=100
	LightBrightness=150.000000
	LightRadius=12.000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.FPm_A500AcidGun'
	DrawScale=0.187500
	SoundPitch=56
	SoundRadius=32.000000
}
