class BulldogWeaponParams extends BallisticWeaponParams;

defaultproperties
{
	Begin Object Class=RecoilParams Name=ArenaRecoilParams
		ViewBindFactor=0.25
		XRandFactor=0.350000
		YRandFactor=0.350000
		MaxRecoil=6144.000000
		DeclineTime=1.500000
		DeclineDelay=0.400000
	End Object

	Begin Object Class=AimParams Name=ArenaAimParams
		AimSpread=(Min=32,Max=1024)
		ADSMultiplier=0.30000
		SprintOffset=(Pitch=-1000,Yaw=-2048)
        JumpOffset=(Pitch=-6000,Yaw=-1500)
        ChaosSpeedThreshold=550.000000
		ChaosDeclineTime=1.600000
	End Object

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
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
}