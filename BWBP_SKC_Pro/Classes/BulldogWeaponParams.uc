class BulldogWeaponParams extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=ArenaPrimaryEffectParams
		TraceRange=(Min=30000.000000,Max=30000.000000)
		RangeAtten=0.5
		Damage=100
		HeadMult=1.5f
		LimbMult=0.9f
		DamageType=Class'BWBP_SKC_Pro.DTBulldog'
		DamageTypeHead=Class'BWBP_SKC_Pro.DTBulldogHead'
		DamageTypeArm=Class'BWBP_SKC_Pro.DTBulldog'
		PenetrateForce=250
		bPenetrate=True
		MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
		FlashScaleFactor=1.100000
		Recoil=1024.000000
		Chaos=1.000000
		BotRefireRate=0.7
		WarnTargetPct=0.5
	End Object

	Begin Object Class=FireParams Name=ArenaPrimaryFireParams
		FireInterval=0.8
		FireEndAnim=
		AimedFireAnim="SightFire"
		FireAnimRate=2.000000	
	FireEffectParams(0)=InstantEffectParams'ArenaPrimaryEffectParams'
	End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	Begin Object Class=ProjectileEffectParams Name=ArenaSecondaryEffectParams
		ProjectileClass=Class'BWBP_SKC_Pro.BulldogRocket'
		SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
		Speed=7000.000000
		MaxSpeed=7000.000000
		Damage=110
		DamageRadius=512.000000
		MomentumTransfer=60000.000000
		MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
		Recoil=2048.000000
		Chaos=1.000000
		BotRefireRate=0.5
		WarnTargetPct=0.75	
	End Object

	Begin Object Class=FireParams Name=ArenaSecondaryFireParams
		FireInterval=0.8
		AmmoPerFire=0
		FireAnim="SGFire"	
	FireEffectParams(0)=ProjectileEffectParams'ArenaSecondaryEffectParams'
	End Object
		
	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=ArenaRecoilParams
		ViewBindFactor=0.25
		XRandFactor=0.350000
		YRandFactor=0.350000
		MaxRecoil=6144.000000
		DeclineTime=1.500000
		DeclineDelay=0.400000
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ArenaAimParams
		AimSpread=(Min=32,Max=1024)
		ADSMultiplier=0.30000
		SprintOffset=(Pitch=-1000,Yaw=-2048)
        JumpOffset=(Pitch=-6000,Yaw=-1500)
        ChaosSpeedThreshold=550.000000
		ChaosDeclineTime=1.600000
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

	Begin Object Class=WeaponParams Name=ArenaParams
		PlayerSpeedFactor=0.900000
		PlayerJumpFactor=0.900000
		InventorySize=12
		SightMoveSpeedFactor=0.8
		SightingTime=0.500000		
		DisplaceDurationMult=1.25
		MagAmmo=8
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
}