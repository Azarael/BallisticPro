class UTComp_HudWDoubleDomination extends HudWDoubleDomination;

simulated function UpdatePrecacheMaterials()
{
	local int i;

	for (i=0; i<class'UTComp_HudSettings'.default.UTCompCrosshairs.Length && class'UTComp_HudSettings'.default.bEnableUTCompCrosshairs; i++ )
		Level.AddPrecacheMaterial(class'UTComp_HudSettings'.default.UTCompCrosshairs[i].CrossTex);
	
	Super.UpdatePrecacheMaterials();
}

simulated function DrawUTCompCrosshair (Canvas C)
{
	local int i;
	local float OldScale,OldW;
	local array<SpriteWidget> CHtexture;

	if ( PawnOwner.bSpecialCrosshair )
	{
		PawnOwner.SpecialDrawCrosshair( C );
		return;
	}
	
	if (!bCrosshairShow)
		return;
	
	for(i=0; i<class'UTComp_HudSettings'.default.UTCompCrosshairs.Length; i++)
	{
		CHTexture.Length=i+1;
		CHTexture[i].WidgetTexture=class'UTComp_HudSettings'.default.UTCompCrosshairs[i].CrossTex;
		CHTexture[i].RenderStyle=STY_Alpha;
		CHTexture[i].TextureCoords.X2=64;
		CHTexture[i].TextureCoords.Y2=64;
		CHTexture[i].TextureScale=class'UTComp_HudSettings'.default.UTCompCrosshairs[i].CrossScale*0.50;
		CHTexture[i].DrawPivot=DP_MiddleMiddle;
		CHTexture[i].PosX=class'UTComp_HudSettings'.default.UTCompCrosshairs[i].OffsetX;
		CHTexture[i].PosY=class'UTComp_HudSettings'.default.UTCompCrosshairs[i].OffsetY;
		CHTexture[i].ScaleMode = SM_None;
		CHTexture[i].Scale=1.00;
		CHTexture[i].Tints[0]=class'UTComp_HudSettings'.default.UTCompCrosshairs[i].CrossColor;
		CHTexture[i].Tints[1]=class'UTComp_HudSettings'.default.UTCompCrosshairs[i].CrossColor;
	}
	
	if ( class'UTComp_HudSettings'.default.bEnableCrosshairSizing && LastPickupTime > Level.TimeSeconds - 0.4 )
	{
		if ( LastPickupTime > Level.TimeSeconds - 0.2 )
			for(i=0; i<CHTexture.Length; i++)
				CHTexture[i].TextureScale *= (1 + 5 * (Level.TimeSeconds - LastPickupTime));
		else
			for(i=0; i<CHTexture.Length; i++)
				CHTexture[i].TextureScale *= (1 + 5 * (LastPickupTime + 0.4 - Level.TimeSeconds));
	}
	
	OldScale = HudScale;
	HudScale=1;
	OldW = C.ColorModulate.W;
	C.ColorModulate.W = 1;
	
	for(i=0; i<CHTexture.Length; i++)
		DrawWidgetAsTile (C, CHTexture[i]);
		
	C.ColorModulate.W = OldW;
	HudScale=OldScale;
	
	DrawEnemyName(C);
}

simulated function DrawCrosshair (Canvas C)
{
	if(class'UTComp_HudSettings'.default.bEnableUTCompCrosshairs && class'UTComp_HudSettings'.default.UTCompCrosshairs.Length>0)
		DrawUTCompCrosshair(C);
	else
		OldDrawCrosshair(C);
}

simulated function OldDrawCrosshair(Canvas C)
{
	local float NormalScale;
	local int i, CurrentCrosshair;
	local float OldScale,OldW, CurrentCrosshairScale;
	local color CurrentCrosshairColor;
	local SpriteWidget CHtexture;
	
	if ( PawnOwner.bSpecialCrosshair )
	{
		PawnOwner.SpecialDrawCrosshair( C );
		return;
	}
	
	if (!bCrosshairShow)
		return;
	
	if ( bUseCustomWeaponCrosshairs && (PawnOwner != None) && (PawnOwner.Weapon != None) )
	{
		CurrentCrosshair = PawnOwner.Weapon.CustomCrosshair;
		
		if (CurrentCrosshair == -1 || CurrentCrosshair == Crosshairs.Length)
		{
			CurrentCrosshair = CrosshairStyle;
			CurrentCrosshairColor = CrosshairColor;
			CurrentCrosshairScale = CrosshairScale;
		}
		else
		{
			CurrentCrosshairColor = PawnOwner.Weapon.CustomCrosshairColor;
			CurrentCrosshairScale = PawnOwner.Weapon.CustomCrosshairScale;
			
			if ( PawnOwner.Weapon.CustomCrosshairTextureName != "" )
			{
				if ( PawnOwner.Weapon.CustomCrosshairTexture == None )
				{
					PawnOwner.Weapon.CustomCrosshairTexture = Texture(DynamicLoadObject(PawnOwner.Weapon.CustomCrosshairTextureName,class'Texture'));
					
					if ( PawnOwner.Weapon.CustomCrosshairTexture == None )
					{
						Log(PawnOwner.Weapon$" custom crosshair texture not found!");
						PawnOwner.Weapon.CustomCrosshairTextureName = "";
					}
				}
				
				CHTexture = Crosshairs[0];
				CHTexture.WidgetTexture = PawnOwner.Weapon.CustomCrosshairTexture;
			}
		}
	}
	else
	{
		CurrentCrosshair = CrosshairStyle;
		CurrentCrosshairColor = CrosshairColor;
		CurrentCrosshairScale = CrosshairScale;
	}
	
	CurrentCrosshair = Clamp(CurrentCrosshair, 0, Crosshairs.Length - 1);
	NormalScale = Crosshairs[CurrentCrosshair].TextureScale;
	
	if ( CHTexture.WidgetTexture == None )
		CHTexture = Crosshairs[CurrentCrosshair];
		
	CHTexture.TextureScale *= 0.5 * CurrentCrosshairScale;
	
	for( i = 0; i < ArrayCount(CHTexture.Tints); i++ )
		CHTexture.Tints[i] = CurrentCrossHairColor;
	
	if (  class'UTComp_HudSettings'.default.bEnableCrosshairSizing && LastPickupTime > Level.TimeSeconds - 0.4 )
	{
		if ( LastPickupTime > Level.TimeSeconds - 0.2 )
			CHTexture.TextureScale *= (1 + 5 * (Level.TimeSeconds - LastPickupTime));
		else
			CHTexture.TextureScale *= (1 + 5 * (LastPickupTime + 0.4 - Level.TimeSeconds));
	}
	
	OldScale = HudScale;
	HudScale=1;
	OldW = C.ColorModulate.W;
	C.ColorModulate.W = 1;
	DrawWidgetAsTile (C, CHTexture);
	C.ColorModulate.W = OldW;
	HudScale=OldScale;
	CHTexture.TextureScale = NormalScale;
	
	DrawEnemyName(C);
}

defaultproperties
{
}
