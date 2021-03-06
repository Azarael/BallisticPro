class Misc_DeathMessage_UTComp extends Misc_DeathMessage;

static function string GetString(
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject 
	)
{
	local string KillerName, VictimName;
	local UTComp_PRI uPRI;

    if(class<DamageType>(OptionalObject) == None)
        return "";

    if(default.Red == "")
    {
        default.Red = class'DMStatsScreen'.static.MakeColorCode(class'SayMessagePlus'.default.RedTeamColor);
        default.Blue = class'DMStatsScreen'.static.MakeColorCode(class'SayMessagePlus'.default.BlueTeamColor);
        default.Text = class'DMStatsScreen'.static.MakeColorCode(class'Misc_DeathMessage'.default.TextColor);
    }
	
    if(RelatedPRI_2 == None)
        VictimName = default.SomeoneString;
    else
    {
    	uPRI = class'UTComp_Util'.static.GetUTCompPRI(RelatedPRI_2);
    	
  		if(class'UTComp_Settings_FREON'.default.bColoredNamesInDM && uPRI != None && uPRI.ColoredName != "")
  			VictimName = uPRI.ColoredName $ default.Text;
      else if(!class'Misc_Player'.default.bTeamColoredDeathMessages || RelatedPRI_2.Team == None)
				VictimName = RelatedPRI_2.PlayerName;
      else if(RelatedPRI_2.Team.TeamIndex == 0)
				VictimName = default.Red $ RelatedPRI_2.PlayerName $ default.Text;
      else
				VictimName = default.Blue $ RelatedPRI_2.PlayerName $ default.Text;
    }

    if(Switch == 1)
      return default.Text $ class'GameInfo'.static.ParseKillMessage(KillerName, VictimName, class<DamageType>(OptionalObject).static.SuicideMessage(RelatedPRI_2));
				
    if(RelatedPRI_1 == None)
        KillerName = default.SomeoneString;
    else
    {
    	uPRI = class'UTComp_Util'.static.GetUTCompPRI(RelatedPRI_1);
    	
      if(class'UTComp_Settings_FREON'.default.bColoredNamesInDM && uPRI != None && uPRI.ColoredName != "")
  			KillerName = uPRI.ColoredName $ default.Text;
      else if(!class'Misc_Player'.default.bTeamColoredDeathMessages || RelatedPRI_2.Team == None)
      	KillerName = RelatedPRI_1.PlayerName;
      else if(RelatedPRI_1.Team.TeamIndex == 0)
      	KillerName = default.Red $ RelatedPRI_1.PlayerName $ default.Text;
      else
       	KillerName = default.Blue $ RelatedPRI_1.PlayerName $ default.Text;
    }

		if (Switch == 2 && class<BallisticDamageType>(OptionalObject) != None && class'BallisticDamageType'.default.bSimpleDeathMessages)
			return default.Text $ class'GameInfo'.static.ParseKillMessage(KillerName, VictimName, class<BallisticDamageType>(OptionalObject).static.ScopedDeathMessage(RelatedPRI_1, RelatedPRI_2));

    return default.Text $ class'GameInfo'.static.ParseKillMessage(KillerName, VictimName, class<DamageType>(OptionalObject).static.DeathMessage(RelatedPRI_1, RelatedPRI_2));
}

defaultproperties
{
}
