_allvideoItems = [[TrainingRoom_Cam1,TrainingRoom_CamTarget1,screen1],[TrainingRoom_Cam2,TrainingRoom_CamTarget2,screen2],[TrainingRoom_Cam3,TrainingRoom_CamTarget3,screen3],[TrainingRoom_Cam4,TrainingRoom_CamTarget4,screen4]];
{
 [_x select 0,_x select 1, _x select 2, str (_x select 0)] ExecVM "camerafeed.sqf";
} ForEach _allvideoItems;