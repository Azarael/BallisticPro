class BOGPWeaponParams extends BallisticWeaponParams;

defaultproperties
{
    Begin Object Class=RecoilParams Name=ArenaRecoilParams
        ViewBindFactor=0.6
        YawFactor=0.000000
        XRandFactor=0.250000
        YRandFactor=0.250000
        DeclineTime=1.000000
        DeclineDelay=0.800000
    End Object

    Begin Object Class=AimParams Name=ArenaAimParams
        AimSpread=(Min=16,Max=378)
        JumpChaos=0.750000
        ChaosDeclineTime=1.000000
    End Object

    Begin Object Class=ProjectileEffectParams Name=ArenaGrenadeEffectParams
        ProjectileClass=Class'BallisticProV55.BOGPGrenade'
        SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
        MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
        Speed=3500.000000
        Damage=120.000000
        DamageRadius=512.000000
        Chaos=0.700000
        Inaccuracy=(X=64,Y=64)
        FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.BOGP.BOGP_Fire',Volume=1.750000)
        SplashDamage=True
        RecommendSplashDamage=True
        WarnTargetPct=0.300000
    End Object

    Begin Object Class=ProjectileEffectParams Name=ArenaFlareEffectParams
        ProjectileClass=Class'BallisticProV55.BOGPFlare'
        SpawnOffset=(X=15.000000,Y=10.000000,Z=-9.000000)
        Speed=5500.000000
        MaxSpeed=7500.000000
        AccelSpeed=100000.000000
        Damage=40.000000
        DamageRadius=64.000000
        MomentumTransfer=0.000000
        MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
        Chaos=0.700000
        Inaccuracy=(X=64,Y=64)
        FireSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_FlareFire',Volume=2.000000,Radius=255.000000,Pitch=1.000000,bNoOverride=True)
        WarnTargetPct=0.100000
    End Object

    Begin Object Class=FireEffectParams Name=ArenaAltEffectParams

    End Object

    Begin Object Class=FireParams Name=ArenaGrenadeFireParams
        PreFireAnim=
        FireEffectParams(0)=ProjectileEffectParams'ArenaGrenadeEffectParams'
        bCockAfterFire=True
    End Object 

    Begin Object Class=FireParams Name=ArenaFlareFireParams
        PreFireAnim=
        FireEffectParams(0)=ProjectileEffectParams'ArenaFlareEffectParams'
        bCockAfterFire=True
    End Object 

    Begin Object Class=FireParams Name=ArenaAltFireParams
        AmmoPerFire=0
        FireInterval=0.200000
        FireEffectParams(0)=FireEffectParams'ArenaAltEffectParams'
    End Object

    Begin Object Class=WeaponParams Name=ArenaParams
        PlayerSpeedFactor=1.05
        DisplaceDurationMult=0.75
        MagAmmo=1
        SightingTime=0.200000
        InventorySize=12
        RecoilParams(0)=RecoilParams'ArenaRecoilParams'
        AimParams(0)=AimParams'ArenaAimParams'
        FireParams(0)=FireParams'ArenaGrenadeFireParams'
        FireParams(1)=FireParams'ArenaFlareFireParams'
        AltFireParams(0)=FireParams'ArenaAltFireParams'
    End Object 
    Layouts(0)=WeaponParams'ArenaParams'
}