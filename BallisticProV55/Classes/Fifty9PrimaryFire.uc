//=============================================================================
// Fifty9PrimaryFire.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2007 RuneStorm. All Rights Reserved.
//=============================================================================
class Fifty9PrimaryFire extends BallisticRangeAttenFire;

const BURST_MODE = 0;
const AUTO_MODE = 1;

var() float AutoFireRate;

//Stub called by the weapon mode when its FireMode changes if bNotifyModeSwitch is set to true
simulated function SwitchWeaponMode (byte NewMode)
{
	if (NewMode == BURST_MODE)
	{
		FireRate = default.FireRate;
		FireRecoil = default.FireRecoil;
	}

	else if (NewMode == AUTO_MODE)
	{
		FireRate = AutoFireRate;
		FireRecoil = default.FireRecoil * 0.9f;
	}
}

//Spawn shell casing for first person
function EjectBrass()
{
	local vector Start, X, Y, Z;
	local Coords C;
	local actor BrassActor;

	if (Level.NetMode == NM_DedicatedServer)
		return;
	if (!class'BallisticMod'.default.bEjectBrass || Level.DetailMode < DM_High)
		return;
	if (BrassClass == None)
		return;
	if (!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
		return;
	if (AIController(Instigator.Controller) != None)
		return;
	C = Weapon.GetBoneCoords(BrassBone);
//	Start = C.Origin + C.XAxis * BrassOffset.X + C.YAxis * BrassOffset.Y + C.ZAxis * BrassOffset.Z;
    Weapon.GetViewAxes(X,Y,Z);
	Start = C.Origin + X * BrassOffset.X + Y * BrassOffset.Y + Z * BrassOffset.Z;
	BrassActor = Spawn(BrassClass, weapon,, Start, Rotator(C.XAxis));
	if (BrassActor != None)
	{
		BrassActor.bHidden=true;
		Fifty9MachinePistol(Weapon).UziBrassList.length = Fifty9MachinePistol(Weapon).UziBrassList.length + 1;
		Fifty9MachinePistol(Weapon).UziBrassList[Fifty9MachinePistol(Weapon).UziBrassList.length-1].Actor = BrassActor;
		Fifty9MachinePistol(Weapon).UziBrassList[Fifty9MachinePistol(Weapon).UziBrassList.length-1].KillTime = level.TimeSeconds + 0.15;
	}
}

defaultproperties
{
     CutOffDistance=1536.000000
     CutOffStartRange=600.000000
     WallPenetrationForce=8.000000

     TraceRange=(Min=3072,Max=3072)
     
     Damage=22.000000
     HeadMult=1.4f
     LimbMult=0.5f
     
     RangeAtten=0.250000
     WaterRangeAtten=0.300000
     DamageType=Class'BallisticProV55.DTFifty9SMG'
     DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
     DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
     PenetrateForce=135
     bPenetrate=True
     ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.Misc.ClipEnd-2',Volume=0.800000,Radius=48.000000,bAtten=True)
     DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryPistol',Volume=0.700000)
     bDryUncock=True
     MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
     FlashScaleFactor=0.400000
     BrassClass=Class'BallisticProV55.Brass_Uzi'
     BrassOffset=(X=-18.000000)
     AimedFireAnim="SightFire"
     FireRecoil=160.000000
     FireChaosCurve=(Points=((InVal=0,OutVal=1),(InVal=0.240000,OutVal=1),(InVal=0.350000,OutVal=1.500000),(InVal=0.660000,OutVal=2.250000),(InVal=1.000000,OutVal=3.500000)))
     XInaccuracy=72.000000
     YInaccuracy=72.000000
     BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Fire',Volume=0.900000)
     bPawnRapidFireAnim=True
     FireRate=0.09
     AutoFireRate=0.0675
     AmmoClass=Class'BallisticProV55.Ammo_FiftyNine'
     ShakeRotMag=(X=64.000000,Y=32.000000)
     ShakeRotRate=(X=10000.000000,Y=10000.000000,Z=10000.000000)
     ShakeRotTime=2.000000
     ShakeOffsetMag=(X=-3.000000)
     ShakeOffsetRate=(X=-1000.000000)
     ShakeOffsetTime=1.500000
	 BurstFireRateFactor=0.55
		 
	 // AI
	 bInstantHit=True
	 bLeadTarget=False
	 bTossed=False
	 bSplashDamage=False
	 bRecommendSplashDamage=False
	 BotRefireRate=0.99
     WarnTargetPct=0.2
}
