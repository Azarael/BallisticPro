//=============================================================================
// MRT6Shotgun.
//
// A very short, powerful and fast double barreled sidearm like shotgun. It has
// A very low range and ridiculous spread, but is devestaing very close up and
// reloads fast. Seondary fires only one barrel.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class MRT6Shotgun extends BallisticProShotgun;

var bool bLeftLoaded;
var bool bRightLoaded;

static function class<Pickup> RecommendAmmoPickup(int Mode)
{
	return class'AP_12GaugeClips';
}

simulated function PlayReload()
{
	if (MagAmmo < 1)
		SetBoneScale (0, 0.0, 'Shell');
	super.PlayReload();
}
/*
simulated function PlayCocking(optional byte Type)
{
	if (Type == 2)
		PlayAnim('ReloadEndCock', CockAnimRate, 0.2);
	Else
		PlayAnim(CockAnim, CockAnimRate, 0.2);
}
*/
/*
simulated function Notify_CockAfterFire()
{
	bPreventReload=false;
	if ((!bRightLoaded || (bRightLoaded && bLeftLoaded)) && bNeedCock && MagAmmo > 0)
		CommonCockGun();
}
*/
simulated function Notify_CockAfterFire()
{
	bPreventReload=false;
//	if ((!bRightLoaded || (bRightLoaded && bLeftLoaded)) && bNeedCock && MagAmmo > 0 &&
//		(OtherGun == None || !CanAlternate(0) || OtherGun.bNeedCock) )
	if ((!bRightLoaded || (bRightLoaded && bLeftLoaded)) && bNeedCock && MagAmmo > 0 )
		CommonCockGun();
}

simulated function Notify_ClipOutOfSight()
{
	SetBoneScale (0, 1.0, 'Shell');
}

simulated function CommonCockGun(optional byte Type)
{
	super.CommonCockGun(Type);
	bLeftLoaded=true;
	bRightLoaded=true;
}

// AI Interface =====
// choose between regular or alt-fire
function byte BestMode()
{
	local Bot B;
	local float Dist;
	local Vector Dir;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return 0;

	Dir = Instigator.Location - B.Enemy.Location;
	Dist = VSize(Dir);

	if (Dist > 700)
		return 1;
	else if (Dist < 300)
		return 0;
	return Rand(2);
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
	
	return class'BUtil'.static.DistanceAtten(Rating, 0.35, Dist, BallisticProShotgunFire(BFireMode[0]).CutOffStartRange, BallisticProShotgunFire(BFireMode[0]).CutOffDistance); 
}

// tells bot whether to charge or back off while using this weapon
function float SuggestAttackStyle()
{
	if (AIController(Instigator.Controller) == None)
		return 0.5;
	return AIController(Instigator.Controller).Skill / 7;
}

// tells bot whether to charge or back off while defending against this weapon
function float SuggestDefenseStyle()
{
	local Bot B;
	local float Result, Dist;

	B = Bot(Instigator.Controller);
	if ( (B == None) || (B.Enemy == None) )
		return -0.5;

	Dist = VSize(B.Enemy.Location - Instigator.Location);

	Result = -1 * (B.Skill / 6);
	Result *= (1 - (Dist/4000));
    return FClamp(Result, -1.0, -0.3);
}
// End AI Stuff =====

defaultproperties
{
    AIRating=0.7
    CurrentRating=0.7
    ManualLines(0)="Fires both barrels. Wide spread and good damage, but requires cocking after every shot."
    ManualLines(1)="Fires one barrel at a time."
    ManualLines(2)="Effective at very close range. Spreads less from the hip than other shotguns."

    bLeftLoaded=True
    bRightLoaded=True
    TeamSkins(0)=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny')
    TeamSkins(1)=(RedTex=Shader'BW_Core_WeaponTex.Hands.RedHand-Shiny',BlueTex=Shader'BW_Core_WeaponTex.Hands.BlueHand-Shiny',SkinNum=3)
    BigIconMaterial=Texture'BW_Core_WeaponTex.Icons.BigIcon_MRT6'
    BCRepClass=Class'BallisticProV55.BallisticReplicationInfo'
    bWT_Shotgun=True
    bWT_Sidearm=True
    SpecialInfo(0)=(Info="180.0;10.0;-999.0;25.0;0.0;0.8;-999.0")
    BringUpSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Pullout')
    PutDownSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Putaway')
    CockSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Cock')
    ClipHitSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6ClipHit')
    ClipOutSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6ClipOut')
    ClipInSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6ClipIn')
    bCockOnEmpty=True
    bAltTriggerReload=True
    WeaponModes(0)=(ModeName="Single Fire")
    WeaponModes(1)=(bUnavailable=True)
    WeaponModes(2)=(bUnavailable=True)
    CurrentWeaponMode=0
    SightPivot=(Pitch=768)
    SightOffset=(X=-30.000000,Z=11.000000)
    SightZoomFactor=0.85
    GunLength=24.000000
    ParamsClasses(0)=Class'MRT6WeaponParams'
    FireModeClass(0)=Class'BallisticProV55.MRT6PrimaryFire'
    FireModeClass(1)=Class'BallisticProV55.MRT6SecondaryFire'
    Description="MRT6 Shotgun Sidearm||Manufacturer: Wot ya Packin Gun Corp|Primary: Dual Barrel Shot|Secondary: Single Barrel Shot"
    Priority=35
    CustomCrossHairTextureName="Crosshairs.HUD.Crosshair_Cross1"
    InventoryGroup=2
    GroupOffset=9
    PickupClass=Class'BallisticProV55.MRT6Pickup'
    PlayerViewOffset=(X=12.000000,Y=3.000000,Z=-8.500000)
    AttachmentClass=Class'BallisticProV55.MRT6Attachment'
    IconMaterial=Texture'BW_Core_WeaponTex.Icons.SmallIcon_MRT6'
    IconCoords=(X2=127,Y2=31)
    ItemName="MRT-6 Shotgun"
    LightType=LT_Pulse
    LightEffect=LE_NonIncidence
    LightHue=25
    LightSaturation=130
    LightBrightness=150.000000
    LightRadius=5.000000
    Mesh=SkeletalMesh'BW_Core_WeaponAnim.FPm_MRT6'
    DrawScale=0.300000
    Skins(0)=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
    Skins(1)=Texture'BW_Core_WeaponTex.MRT6.MRT6Skin'
    Skins(2)=Texture'BW_Core_WeaponTex.MRT6.MRT6Small'
    Skins(3)=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny'
}
