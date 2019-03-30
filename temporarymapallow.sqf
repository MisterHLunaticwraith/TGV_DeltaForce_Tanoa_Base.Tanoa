openMap [true,false];
if !("ItemMap" in assigneditems MRH_player) then
{
	MRH_player linkItem "ItemMap";
	waitUntil{!visibleMap};
	MRH_player unlinkItem "ItemMap";
};