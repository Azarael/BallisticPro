//=============================================================================
// SK410HEProjectile.
//
// An explosive slug
//
// by Nolan "Dark Carnivour" Richert.
// Copyright(c) 2005 RuneStorm. All Rights Reserved.
//=============================================================================
class ARProjectile extends BallisticGrenade;

simulated event ProcessTouch( actor Other, vector HitLocation )
{
	if (Other == Instigator && (!bCanHitOwner))
		return;
	if (Other == HitActor)
		return;
	if (Base != None)
		return;

	if ( Instigator == None || Instigator.Controller == None )
		Other.SetDelayedDamageInstigatorController( InstigatorController );

	class'BallisticDamageType'.static.GenericHurt (Other, ImpactDamage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
	HitActor = Other;
	Explode(HitLocation, Normal(HitLocation-Other.Location));
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
		DampenFactor *= 0.01;
		DampenFactorParallel *= 0.01;
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

function TargetedHurtRadius( float DamageAmount, float DamageRadius, class<DamageType> DamageType, float Momentum, vector HitLocation, Optional actor Victim )
{
	local actor Victims;
	local float damageScale, dist;
	local vector dir;

	if( bHurtEntry )
		return;

	bHurtEntry = true;
	
	if (Victim == None)
	{
		DamageAmount *= 0.5;
		DamageRadius *= 0.75;
	}
	foreach CollidingActors( class 'Actor', Victims, DamageRadius, HitLocation )
	{
		// don't let blast damage affect fluid - VisibleCollisingActors doesn't really work for them - jag
		if( (Victims != self) && (Victims.Role == ROLE_Authority) && (!Victims.IsA('FluidSurfaceInfo')) && Victims != Victim && Victims != HurtWall)
		{
			if (!FastTrace(Victims.Location, Location))
				continue;
					
			dir = Victims.Location;
			if (Victims.Location.Z > HitLocation.Z)
				dir.Z = FMax(HitLocation.Z, dir.Z - Victims.CollisionHeight);
			else dir.Z = FMin(HitLocation.Z, dir.Z + Victims.CollisionHeight);
			dir -= HitLocation;
			dist = FMax(1,VSize(dir));
			dir = dir/dist;
			damageScale = 1 - FMax(0,(dist - Victims.CollisionRadius)/ DamageRadius);
			if ( Instigator == None || Instigator.Controller == None )
				Victims.SetDelayedDamageInstigatorController( InstigatorController );
			class'BallisticDamageType'.static.GenericHurt
			(
				Victims,
				Square(damageScale) * DamageAmount,
				Instigator,
				Victims.Location - 0.5 * (Victims.CollisionHeight + Victims.CollisionRadius) * dir,
				(damageScale * Momentum * 0.6 * dir),
				DamageType
			);
		 }
	}
	bHurtEntry = false;
}

simulated function Explode(vector HitLocation, vector HitNormal)
{
	local ARFireControl F;
	local Teleporter TB;

	if ( Role == ROLE_Authority )
	{
		//No teleporter camping, die die die
		foreach RadiusActors(class'Teleporter', TB, 256)
		{
			if (Instigator != None)
				Level.Game.Broadcast(self, "RCS Grenade thrown by"@Instigator.PlayerReplicationInfo.PlayerName@"too close to a teleporter!");
			return;
		}
		F = Spawn(class'ARFireControl',self,,HitLocation-HitNormal*2, rot(0,0,0));
		if (F!=None)
		{
			F.Instigator = Instigator;
			F.Initialize();
		}
	}
	Destroy();
}

defaultproperties
{
     DetonateOn=DT_Impact
     bNoInitialSpin=True
     bAlignToVelocity=True
     DetonateDelay=0.150000
     ImpactDamage=15.000000
     ImpactDamageType=Class'BallisticJiffyPack.DTARGrenade'
     ImpactManager=Class'BallisticProV55.IM_Grenade'
     AccelSpeed=3000.000000
     TrailClass=Class'BallisticJiffyPack.ARFireTrail'
     TrailOffset=(X=-8.000000)
     MyRadiusDamageType=Class'BallisticJiffyPack.DTARBurned'
     SplashManager=Class'BallisticProV55.IM_ProjWater'
     ShakeRadius=512.000000
     MotionBlurRadius=128.000000
     Speed=4000.000000
     MaxSpeed=15000.000000
     Damage=80.000000
     DamageRadius=128.000000
     MomentumTransfer=0.000000
     MyDamageType=Class'BallisticJiffyPack.DTARGrenade'
     LightHue=180
     LightSaturation=100
     LightBrightness=160.000000
     LightRadius=8.000000
     StaticMesh=StaticMesh'BallisticRecolors4StaticPro.Bulldog.Frag12Proj'
     LifeSpan=16.000000
     DrawScale=2.000000
}
