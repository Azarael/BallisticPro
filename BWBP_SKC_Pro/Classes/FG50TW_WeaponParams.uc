class FG50TW_WeaponParams extends BallisticWeaponParams;

defaultproperties
{
	Begin Object Class=RecoilParams Name=ArenaRecoilParams
		ViewBindFactor=0.100000
		XCurve=(Points=(,(InVal=0.15,OutVal=0.075),(InVal=0.400000,OutVal=0.130000),(InVal=0.550000,OutVal=0.15000),(InVal=0.700000,OutVal=0.21000),(InVal=1.000000,OutVal=0.225000)))
		YCurve=(Points=(,(InVal=0.20000,OutVal=0.250000),(InVal=0.400000,OutVal=0.40000),(InVal=0.600000,OutVal=0.700000),(InVal=1.000000,OutVal=1.000000)))
		PitchFactor=0.050000
		XRandFactor=0.200000
		YRandFactor=0.050000
		MaxRecoil=1200.000000
		DeclineTime=1.000001
	End Object

	Begin Object Class=AimParams Name=ArenaAimParams
		ADSMultiplier=0.7
		AimSpread=(Min=0,Max=0)
		AimDamageThreshold=2000.000000
		ChaosDeclineTime=1.750000
		ChaosSpeedThreshold=350
		SprintOffset=(Pitch=-3072,Yaw=-4096)
		JumpOffset=(Pitch=-6000,Yaw=2000)
	End Object 

	Begin Object Class=WeaponParams Name=ArenaParams
		PlayerSpeedFactor=0.850000
		PlayerJumpFactor=0.850000
		InventorySize=12
		SightMoveSpeedFactor=0.8
		SightingTime=0.01		
		DisplaceDurationMult=1.25
		MagAmmo=40
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
		AimParams(0)=AimParams'ArenaAimParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
}