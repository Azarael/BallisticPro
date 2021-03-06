//=============================================================================
// BallisticGrenade.
//
// General purpose grenade for ballistic weapons.
// They travel in an arc, bounce off walls and can react differently depending
// on their settings. New features include: different detonation conditions,
// abliity to stick to or bounce off enemies (and friends). Also trail,
// alignment, effect and flak settings.
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class BallisticGrenade extends BallisticProjectile
	abstract;


var() enum EDetonateType				// Different ways that grenade can detonate
{
	DT_Timer,					// Detonate when timer runs out
	DT_Impact,					// Detonate on impact
	DT_ImpactTimed,				// Detonate on timer that only starts on impact
	DT_None						// Don't use normal detonation
} DetonateOn;

var() enum EPlayerImpactType	// Different ways that grenade can impact with players
{
	PIT_Bounce,					// Bounce off players
	PIT_Detonate,				// Detonate
	PIT_Stick					// Stick to players
} PlayerImpactType;

var() class<BCImpactManager>	ReflectImpactManager;
var() float						DampenFactor;			// Bounce Damping
var() float						DampenFactorParallel;	// Parallel Bounce Damping
var() float						RandomSpin;				// Random spin amount
var() bool						bNoInitialSpin;			// Do not apply random spin until impact
var() bool						bAlignToVelocity;		// If true, grenaded always faces in the direction of its velocity
var	  bool						bHasImpacted;			// Has it hit anything yet?
//var	  bool					bCanHitOwner;			// Can impact with owner

var() float 					DetonateDelay;			// Time before detonation. Starts on spawn for DT_Timer. Starts on impact for DT_ImpactTimed

var() int						FlakCount;				// How many chunks of flak to fling on explode
var() Class<Projectile>			FlakClass;				// Flak projectiles to fling on explode

var() bool						TrailWhenStill;			// If true, trail actor stays when not moving

var() int						ImpactDamage;			// Damage when hitting or sticking to players and not detonating
var() Class<DamageType>			ImpactDamageType;		// Type of Damage caused for striking or sticking to players
var() float						MinStickVelocity;		// Minimum velocity required to stick to players

var   Rotator					VelocityDir;

var	float						PokeReductionFactor;

var globalconfig bool 			bAllowTerrainPoking;

simulated event PostBeginPlay()
{
	Super.PostBeginPlay();

	VelocityDir = Rotation;
	if (StartDelay > 0 && Role == ROLE_Authority || bAlwaysRelevant)
	{
		SetPhysics(PHYS_None);
		SetCollision (false, false, false);
		bHidden=true;
		SetTimer(StartDelay, false);
		return;
	}
	InitProjectile();

}

simulated function PostNetBeginPlay()
{
	local PlayerController PC;
	
    Acceleration = Normal(Velocity) * AccelSpeed;

	if (Level.NetMode == NM_DedicatedServer)
		return;

	if ( Level.bDropDetail || Level.DetailMode == DM_Low )
	{
		bDynamicLight = false;
		LightType = LT_None;
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		if ( (PC == None) || (Instigator == None) || (PC != Instigator.Controller) )
		{
			bDynamicLight = false;
			LightType = LT_None;
		}
	}
}

simulated function InitProjectile ()
{
    Velocity = Speed * Vector(VelocityDir);
    if (RandomSpin != 0 && !bNoInitialSpin)
        RandSpin(RandomSpin);
    if (DetonateOn == DT_Timer)
        SetTimer(DetonateDelay, false);
    Super.InitProjectile();
}

simulated event Timer()
{
	if (StartDelay > 0)
	{
		StartDelay = 0;
		bHidden=false;
		SetPhysics(default.Physics);
		SetCollision (default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
		//InitEffects();
		return;
	}

	Explode(Location, vect(0,0,1));
}

// Destroy effects
simulated function DestroyEffects()
{
	if (Trail != None)
	{
		if (Emitter(Trail) != None)
			Emitter(Trail).Kill();
		else
			Trail.Destroy();
	}
}

// Make the thing look like its pointing in the direction its going
simulated event Tick( float DT )
{
	if (bAlignToVelocity && ( RandomSpin == 0 || (bNoInitialSpin && !bHasImpacted) ))
		SetRotation(Rotator(Velocity));
}

simulated event Landed( vector HitNormal )
{
	HitWall( HitNormal, None );
}

simulated event UsedBy( Pawn User )
{
	if (User == Base)
	{
		bCanHitOwner = False;
		SetBase (None);
		SetPhysics(PHYS_Falling);
		Velocity = -Vector(Rotation)*200;
	}
}

singular function BaseChange()
{
	if (Base == None)
	{
		SetPhysics(PHYS_Falling);
	}
}

simulated function bool CanTouch(Actor Other)
{
    if (Base != None)
        return false;

    return Super.CanTouch(Other);
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
    if ( Instigator == None || Instigator.Controller == None )
		Other.SetDelayedDamageInstigatorController( InstigatorController );

    if (PlayerImpactType == PIT_Detonate || DetonateOn == DT_Impact)
        class'BallisticDamageType'.static.GenericHurt (Other, Damage, Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), ImpactDamageType);
    else 
        class'BallisticDamageType'.static.GenericHurt (Other, ImpactDamage, Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), ImpactDamageType);
}

//===============================================================
// Impact
//
// Called when a projectile has struck an actor directly, after 
// ApplyImpactEffect is used to affect that actor (damage, DoT, etc)
//
// Returns true if the function has handled the projectile's 
// future behaviour. Returns false if the projectile should 
// explode instead.
//===============================================================
simulated function bool Impact(Actor Other, Vector HitLocation)
{
    local float BoneDist;

    if (PlayerImpactType == PIT_Detonate || DetonateOn == DT_Impact)
	{
		Explode(HitLocation, Normal(HitLocation-Other.Location));
	}
	else if ( PlayerImpactType == PIT_Bounce || (PlayerImpactType == PIT_Stick && (VSize (Velocity) < MinStickVelocity)) )
	{
		HitWall (Normal(HitLocation - Other.Location), Other);
	}
	else if ( PlayerImpactType == PIT_Stick && Base == None )
	{
		SetPhysics(PHYS_None);
		if (DetonateOn == DT_ImpactTimed)
			SetTimer(DetonateDelay, false);
		if (Other != Instigator && Other.DrawType == DT_Mesh)
			Other.AttachToBone( Self, Other.GetClosestBone( Location, Velocity, BoneDist) );
		else
			SetBase (Other);

		SetRotation (Rotator(Velocity));
		Velocity = vect(0,0,0);
	}

    return true;
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
		SetTimer(DetonateDelay, false);
	if (Pawn(Wall) != None)
	{
		DampenFactor *= 0.5;
		DampenFactorParallel *= 0.5;
	}

	bCanHitOwner=true;
	bHasImpacted=true;

    VNorm = (Velocity dot HitNormal) * HitNormal;
    Velocity = -VNorm * DampenFactor + (Velocity - VNorm) * DampenFactorParallel;

	if (RandomSpin != 0)
		RandSpin(100000);
	Speed = VSize(Velocity);

	if (Speed < 20)
	{
		bBounce = False;
		SetPhysics(PHYS_None);
		if (Trail != None && !TrailWhenStill)
		{
			DestroyEffects();
		}
	}
	else if (Pawn(Wall) == None && (Level.NetMode != NM_DedicatedServer) && (Speed > 100) && !Level.bDropDetail && EffectIsRelevant(Location,false))
	{
		if (ImpactSound != None)
			PlaySound(ImpactSound, SLOT_Misc );
		if (ReflectImpactManager != None)
		{
			if (Instigator == None)
				ReflectImpactManager.static.StartSpawn(Location, HitNormal, Wall.SurfaceType, Level.GetLocalPlayerController()/*.Pawn*/);
			else
				ReflectImpactManager.static.StartSpawn(Location, HitNormal, Wall.SurfaceType, Instigator);			
		}
    }
}

simulated function BlowUp(vector HitLocation)
{
	local vector Start;
    local rotator Dir;
    local int i;

	Start = Location/* + 10 * HitNormal*/;
	if (FlakCount > 0 && FlakClass != None)
	{
		for (i=0;i<FlakCount;i++)
		{
			Dir.Yaw += FRand()*40000-20000;
			Dir.Pitch += FRand()*40000-20000;
			Spawn( FlakClass,, '', Start, Dir);
		}
	}
	TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	if ( Role == ROLE_Authority )
		MakeNoise(1.0);
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local Actor A;
	local Vector HitLoc, HitNorm, End;
	
	if (ShakeRadius > 0)
		ShakeView(HitLocation);
	BlowUp(HitLocation);
	
	End.Z = -DamageRadius;
	
	A = Trace(HitLoc, HitNorm, End, , False);

    // rarely used
	if (TerrainInfo(A) != None && bAllowTerrainPoking)
		TerrainInfo(A).PokeTerrain(Location, DamageRadius, DamageRadius/PokeReductionFactor);

    if (ImpactManager != None)
	{
		if (Instigator == None)
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController()/*.Pawn*/);
		else
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
	}

	if (bTearOnExplode && !bNetTemporary && Level.NetMode == NM_DedicatedServer || Level.NetMode == NM_ListenServer)
	{
		Velocity = vect(0,0,0);
		SetCollision(false,false,false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');
	}
	
	else Destroy();
}

defaultproperties
{
     DampenFactor=0.05000
     DampenFactorParallel=0.350000
     RandomSpin=32768.000000
     DetonateDelay=3.000000
     FlakClass=Class'XWeapons.FlakChunk'
     TrailWhenStill=True
     MinStickVelocity=200.000000
     PokeReductionFactor=30.000000
     Speed=1000.000000
     Damage=70.000000
     DamageRadius=240.000000
     MomentumTransfer=75000.000000
     Physics=PHYS_Falling
     DrawScale=8.000000
     bHardAttach=True
     bBounce=True
     bFixedRotationDir=True
     RotationRate=(Roll=10000)
}
