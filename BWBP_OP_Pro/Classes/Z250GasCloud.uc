class Z250GasCloud extends RX22AGasCloud
	placeable;

simulated function Ignite(Pawn EventInstigator)
{
	local RX22ACloudBang Bang;

	bIgnited = true;
	if (level.NetMode != NM_DedicatedServer)
	{
		Bang = Spawn(class'RX22ACloudBang',,,Location);
		Bang.InitCloudBang(Fuel/MaxFuel);
		PlaySound(IgniteSound, , 0.8, , 112);
	}
	if (Role == ROLE_Authority)
	{
		Ignitioneer = EventInstigator;
		HurtRadius(25 + Fuel * 5, 128 + Fuel * 3, class'DTRX22ACloudBomb', 10000, Location);
	}
}

defaultproperties
{
}
