//=============================================================================

// MGL870Grenade.
//
// Grenade fired by MGL-870 grenade launcher.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class MGLGrenade extends BallisticGrenade;

var bool bArmed;

simulated function PostNetBeginPlay()
{
	Super.PostNetBeginPlay();
	SetTimer(0.15, False);
}

simulated function Timer()
{
	if(StartDelay > 0)
	{
		Super.Timer();
		return;
	}
	
	if (!bHasImpacted)
		DetonateOn=DT_Impact;
		
	else Explode(Location, vect(0,0,1));
}

simulated event HitWall(vector HitNormal, actor Wall)
{
    local Vector VNorm;
	
	if (DetonateOn == DT_Impact)
	{
		Explode(Location, HitNormal);
		return;
	}
	else if (DetonateOn == DT_ImpactTimed && !bHasImpacted)
	{
		SetTimer(DetonateDelay, false);
	}
	if (Pawn(Wall) != None)
	{
		DampenFactor *= 0.2;
		DampenFactorParallel *= 0.2;
	}

	bCanHitOwner=true;
	bHasImpacted=true;

    VNorm = (Velocity dot HitNormal) * HitNormal;
    Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;

	if (RandomSpin != 0)
		RandSpin(100000);
	
	Speed = VSize(Velocity/2);

	if (Speed < 20)
	{
		bBounce = False;
		SetPhysics(PHYS_None);
		if (Trail != None && !TrailWhenStill)
		{
			DestroyEffects();
		}
	}
	else if (Pawn(Wall) == None && (Level.NetMode != NM_DedicatedServer) && (Speed > 100) && (!Level.bDropDetail) && (Level.DetailMode != DM_Low) && EffectIsRelevant(Location,false))
	{
		if (ImpactSound != None)
			PlaySound(ImpactSound, SLOT_Misc, 1.5);
		if (ImpactManager != None)
			ImpactManager.static.StartSpawn(Location, HitNormal, Wall.SurfaceType, Owner);
    	}
}

defaultproperties
{
     DetonateOn=DT_ImpactTimed
     PlayerImpactType=PIT_Detonate
     DampenFactor=0.150000
     DampenFactorParallel=0.300000
     bNoInitialSpin=True
     bAlignToVelocity=True
     DetonateDelay=1.10000
     ImpactDamage=100
     ImpactDamageType=Class'BWBPRecolorsPro.DTMGLGrenade'
     ImpactManager=Class'BWBPRecolorsPro.IM_MGLGrenade'
     TrailClass=Class'BWBPRecolorsPro.MGLNadeTrail'
     MyRadiusDamageType=Class'BWBPRecolorsPro.DTMGLGrenadeRadius'
     SplashManager=Class'BallisticProV55.IM_ProjWater'
     ShakeRadius=512.000000
     MotionBlurRadius=400.000000
     MotionBlurFactor=3.000000
     MotionBlurTime=4.000000
     bCoverPenetrator=True
     Speed=4500.000000
     Damage=120.000000
     DamageRadius=512.000000
     MyDamageType=Class'BWBPRecolorsPro.DTMGLGrenadeRadius'
     ImpactSound=Sound'PackageSounds4Pro.Misc.FLAK-GrenadeBounce'
     StaticMesh=StaticMesh'BallisticHardware2.M900.M900Grenade'
}
