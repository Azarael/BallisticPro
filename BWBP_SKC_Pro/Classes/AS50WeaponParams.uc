class AS50WeaponParams extends BallisticWeaponParams;

defaultproperties
{
    //=================================================================
    // PRIMARY FIRE
    //=================================================================	
	
	Begin Object Class=InstantEffectParams Name=ArenaPrimaryEffectParams
		TraceRange=(Min=30000.000000,Max=30000.000000)
		Damage=75
		HeadMult=1.5f
		LimbMult=0.9f
		DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
		DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
		DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
		PenetrateForce=450
		bPenetrate=True
		PDamageFactor=0.800000
		WallPDamageFactor=0.850000
		MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
		Recoil=450.000000
		Chaos=1.000000
		BotRefireRate=0.5
		WarnTargetPct=0.4
	End Object

	Begin Object Class=FireParams Name=ArenaPrimaryFireParams
		FireInterval=0.350000
		FireAnim="CFire"
		FireEndAnim=	
		FireEffectParams(0)=InstantEffectParams'ArenaPrimaryEffectParams'
	End Object
		
    //=================================================================
    // SECONDARY FIRE
    //=================================================================	
	
	
	Begin Object Class=InstantEffectParams Name=ArenaSecondaryEffectParams
		TraceRange=(Min=15000.000000,Max=15000.000000)
		Damage=40
		HeadMult=1.5f
		LimbMult=0.9f
		DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
		DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
		DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
		PDamageFactor=0.000000
		WallPDamageFactor=0.850000
		MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
		Recoil=768.000000
		Chaos=1.000000
		BotRefireRate=0.50000
		WarnTargetPct=0.40000
	End Object

	Begin Object Class=FireParams Name=ArenaSecondaryFireParams
		FireInterval=0.350000
		FireAnim="CFire"
		FireEndAnim=	
		FireEffectParams(0)=InstantEffectParams'ArenaSecondaryEffectParams'
	End Object

	//=================================================================
	// RECOIL
	//=================================================================

	Begin Object Class=RecoilParams Name=FSSG50RecoilParams
		ViewBindFactor=0.15
		XCurve=(Points=(,(InVal=0.200000,OutVal=0.200000),(InVal=0.400000,OutVal=0.300000),(InVal=0.800000,OutVal=0.400000),(InVal=1.000000,OutVal=0.500000)))
		YCurve=(Points=(,(InVal=0.200000,OutVal=0.200000),(InVal=0.400000,OutVal=0.350000),(InVal=0.600000,OutVal=0.750000),(InVal=0.800000,OutVal=0.900000),(InVal=1.000000,OutVal=1.000000)))
		XRandFactor=0.15
		YRandFactor=0.15
		MinRandFactor=0.15
		DeclineTime=1.500000
		DeclineDelay=0.500000
		CrouchMultiplier=0.650000
	End Object

	//=================================================================
	// AIM
	//=================================================================

	Begin Object Class=AimParams Name=ArenaAimParams
		AimSpread=(Min=64,Max=1024)
		ADSMultiplier=0.15
		SprintOffset=(Pitch=-3000,Yaw=-4096)
		JumpOffset=(Pitch=-6000,Yaw=2000)
		AimAdjustTime=0.600000
		ChaosDeclineTime=0.800000
		ChaosSpeedThreshold=350.000000
	End Object

	//=================================================================
	// BASIC PARAMS
	//=================================================================	

	Begin Object Class=WeaponParams Name=ArenaParams
		PlayerSpeedFactor=0.90000
		PlayerJumpFactor=0.90000
        DisplaceDurationMult=1.25
		InventorySize=12
		SightMoveSpeedFactor=0.8
		SightingTime=0.650000		
		MagAmmo=8
        ZoomType=ZT_Logarithmic
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
		FireParams(0)=FireParams'ArenaPrimaryFireParams'
		AltFireParams(0)=FireParams'ArenaSecondaryFireParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
}