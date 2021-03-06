class MACTW_WeaponParams extends BallisticWeaponParams;

defaultproperties
{
	Begin Object Class=RecoilParams Name=ArenaRecoilParams
		ViewBindFactor=0.000000
		PitchFactor=0.100000
		YawFactor=0.500000
		XRandFactor=0.300000
		YRandFactor=0.200000
		DeclineTime=1.500000
		MinRandFactor=0.350000
	End Object

	Begin Object Class=AimParams Name=ArenaAimParams
		ViewBindFactor=1
		SprintOffSet=(Pitch=-7000,Yaw=-3500)
		JumpOffSet=(Pitch=-6000,Yaw=-1500)
		AimAdjustTime=1.000000
		AimSpread=(Min=8,Max=32)
		ChaosDeclineTime=1.200000
		ChaosSpeedThreshold=3500.000000
		AimDamageThreshold=2000
	End Object

	Begin Object Class=WeaponParams Name=ArenaParams
		DisplaceDurationMult=1.25
		PlayerSpeedFactor=0.80000
		PlayerJumpFactor=0.80000
		SightMoveSpeedFactor=0.8
		SightingTime=0.10000
		MagAmmo=5
        InventorySize=35
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
}