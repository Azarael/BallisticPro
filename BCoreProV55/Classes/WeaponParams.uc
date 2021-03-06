//=============================================================================
// WeaponParams.
//
// Parameters declared as a subobject within a Ballistic Weapon. The correct 
// parameters are selected based on the game style.
//
// by Azarael 2020
//=============================================================================
class WeaponParams extends Object
    editinlinenew;

// Struct used for skin replacements
struct MaterialSwap
{
    var()   Material    Material;
    var()   int         Index;
};

struct BoneScale
{
    var()   Name        BoneName;
    var()   int         Slot;
    var()   float       Scale;
};

enum EZoomType
{
	ZT_Irons, // Iron sights or simple non-magnifying aiming aid such as a red dot sight or holographic. Smoothly zooms into FullZoomFOV as the weapon repositions to sights view.
	ZT_Fixed, // Fixed scope zoom. Does not allow any change in zoom and goes straight to FullZoomFOV when StartScopeView is called.
	ZT_Logarithmic, //Zooms between MinZoom and MaxZoom magnification levels in relative steps.
	ZT_Minimum, // Minimum zoom level. Zooms straight to the lowest zoom level and stops on scope up. Will zoom between FOV (90 - (88 * MinFixedZoomLevel)) and FullZoomFOV.
	ZT_Smooth // Smooth zoom. Replaces bSmoothZoom, allows the weapon to zoom from FOV 90 to FullZoomFOV.
};

//-----------------------------------------------------------------------------
// Movement speed
//-----------------------------------------------------------------------------
var() float					PlayerSpeedFactor;		// Instigator movement speed is multiplied by this when this weapon is in use
var() float					PlayerJumpFactor;		// Player JumpZ multiplied by this when holding this weapon
//-----------------------------------------------------------------------------
// Conflict Loadout
//-----------------------------------------------------------------------------
var() byte					InventorySize;			// How much space this weapon should occupy in an inventory. 0-100. Used by mutators, games, etc...
//-----------------------------------------------------------------------------
// Sighting
//-----------------------------------------------------------------------------
var() float					SightMoveSpeedFactor;	// Additional slowdown factor in iron sights
var() float					SightingTime;			// Time it takes to move weapon to and from sight view
var() Vector                SightOffset;            // Offset when moving weapon to ADS position
var() Rotator               SightPivot;             // Pivot when moving weapon to ADS position
var() EZoomType             ZoomType;               // Type of zoom. Precise control is within the weapon's sighting properties
//-----------------------------------------------------------------------------
// Appearance
//-----------------------------------------------------------------------------
var() array<MaterialSwap>   WeaponMaterialSwaps;
var() array<BoneScale>      WeaponBoneScales;
var() array<MaterialSwap>   AttachmentMaterialSwaps;
//-----------------------------------------------------------------------------
// Aim
//-----------------------------------------------------------------------------
var() float					DisplaceDurationMult;   // Duration multiplier for aim displacement.
//-----------------------------------------------------------------------------
// Ammo
//-----------------------------------------------------------------------------
var() int			        MagAmmo;				//Ammo currently in magazine for Primary and Secondary. Max is whatever the default is.

var() array<RecoilParams>	RecoilParams;
var() array<AimParams>		AimParams;
var() array<FireParams>     FireParams;
var() array<FireParams>     AltFireParams;

defaultproperties
{
    PlayerSpeedFactor=1.000000
    PlayerJumpFactor=1.000000
    InventorySize=12
    SightMoveSpeedFactor=0.900000
    SightingTime=0.350000
    ZoomType=ZT_Irons
    DisplaceDurationMult=1.000000
    MagAmmo=30
}