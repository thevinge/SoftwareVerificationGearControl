//This file was generated from (Commercial) UPPAAL 4.0.15 rev. CB6BB307F6F681CB, November 2019

/*
Can we change a gear?
*/
E<> GearControl.GearChanged

/*
Can we change to gear 5
*/
E<> Interface.Gear5

/*
Can we change to reverse gear?
*/
E<> Interface.GearR

/*
Does it take less than 1000 time units to change a gear
*/
E<> ( GearControl.GearChanged and ( SysTimer<=1000 ) )

/*

*/
A[] not ( GearBox.Neutral and \
( Interface.Gear1 or Interface.Gear2 or \
Interface.Gear3 or Interface.Gear4 or \
Interface.Gear5 or Interface.GearR ) )

/*

*/
A[] not ( GearBox.Idle and Interface.GearN )

/*

*/
A[] ( Interface.GearN imply GearBox.Neutral )

/*

*/
A[] ( ( ErrStat==0 and UseCase==0 and SysTimer>=900 ) imply \
( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
E<> ( ErrStat==0 and UseCase==0 and \
SysTimer>899 and SysTimer<900 and \
not ( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
A[] ( ( ErrStat==0 and UseCase==0 and ( SysTimer<150 ) ) imply \
not ( GearControl.GearChanged ) )

/*

*/
E<> ( ErrStat==0 and UseCase==0 and GearControl.GearChanged and \
( SysTimer==150 ) )

/*

*/
A[] ( ( ErrStat==0 and UseCase==0 and FromGear>0 and \
ToGear>0 and ( SysTimer<400 ) ) imply \
not ( GearControl.GearChanged ) )

/*

*/
E<> ( ErrStat==0 and UseCase==0 and FromGear>0 and ToGear>0 and \
GearControl.GearChanged and ( SysTimer==400 ) )

/*

*/
A[] ( ( ErrStat==0 and UseCase==1 and SysTimer>1055 ) imply \
( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
E<> ( ErrStat==0 and UseCase==1 and SysTimer==1055 and \
not ( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
A[] ( ( ErrStat==0 and UseCase==1 and SysTimer<550 ) imply \
not ( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
E<> ( ErrStat==0 and UseCase==1 and GearControl.GearChanged and \
( SysTimer==550 ) )

/*

*/
A[] ( ( ErrStat==0 and UseCase==1 and FromGear>0 and \
ToGear>0 and SysTimer<700 ) imply \
not ( GearControl.GearChanged and GearControl.Gear ) )

/*

*/
E<> ( ErrStat==0 and UseCase==1 and FromGear>0 and ToGear>0 and \
GearControl.GearChanged and \
( SysTimer==700 ) )

/*

*/
A[] ( ( ErrStat==0 and UseCase==2 and SysTimer>=1205 ) imply \
( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
E<> ( ErrStat==0 and UseCase==2 and SysTimer>1204 and \
SysTimer<1205 and \
not ( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
A[] ( ( UseCase==2 and ( SysTimer<450 ) ) imply \
not ( GearControl.GearChanged or GearControl.Gear ) )

/*

*/
E<> ( UseCase==2 and GearControl.GearChanged and \
( SysTimer==450 ) )

/*

*/
A[] ( ( ErrStat==0 and UseCase==2 and FromGear>0 and \
ToGear>0 and SysTimer<750 ) imply \
not ( GearControl.GearChanged and GearControl.Gear ) )

/*

*/
E<> ( ErrStat==0 and UseCase==2 and FromGear>0 and ToGear>0 and \
GearControl.GearChanged and \
( SysTimer==750 ) )

/*

*/
A[] ( ( Clutch.ErrorClose and ( GCTimer>200 ) ) imply \
GearControl.CCloseError )

/*

*/
A[] ( GearControl.CCloseError imply Clutch.ErrorClose )

/*

*/
A[] ( ( Clutch.ErrorOpen and ( GCTimer>200 ) ) imply \
GearControl.COpenError )

/*

*/
A[] ( ( GearControl.COpenError ) imply Clutch.ErrorOpen )

/*

*/
A[] ( ( GearBox.ErrorIdle and ( GCTimer>350 ) ) imply \
GearControl.GSetError )

/*

*/
A[] ( ( GearControl.GSetError ) imply GearBox.ErrorIdle )

/*

*/
A[] ( ( GearBox.ErrorNeu and ( GCTimer>200 ) ) imply \
GearControl.GNeuError )

/*

*/
A[] ( ( GearControl.GNeuError ) imply GearBox.ErrorNeu )

/*

*/
A[] not ( ErrStat==0 and Engine.ErrorSpeed )

/*

*/
A[] ( Interface.GearN imply \
( ( ToGear==0 and Engine.Zero ) or Engine.Initial ) )

/*

*/
A[] ( ( GearControl.Gear and Interface.GearR ) imply \
Engine.Torque )

/*

*/
A[] ( ( GearControl.Gear and Interface.Gear1 ) imply \
Engine.Torque )

/*

*/
A[] ( ( GearControl.Gear and Interface.Gear2 ) imply \
Engine.Torque )

/*

*/
A[] ( ( GearControl.Gear and Interface.Gear3 ) imply \
Engine.Torque )

/*

*/
A[] ( ( GearControl.Gear and Interface.Gear4 ) imply \
Engine.Torque )

/*

*/
A[] ( ( GearControl.Gear and Interface.Gear5 ) imply \
Engine.Torque )

/*

*/
A[] ( Clutch.Open imply \
( GearControl.ClutchOpen or GearControl.ClutchOpen2 or \
GearControl.CheckGearSet2 or GearControl.ReqSetGear2 or \
GearControl.GNeuError or \
GearControl.ClutchClose or \
GearControl.CheckClutchClosed or \
GearControl.CheckClutchClosed2 or \
GearControl.CCloseError or \
GearControl.GSetError or GearControl.CheckGearNeu2 ) )

/*

*/
A[] ( Clutch.Closed imply \
( GearControl.ReqTorqueC or GearControl.GearChanged or \
GearControl.Gear or GearControl.Initiate or \
GearControl.CheckTorque or GearControl.ReqNeuGear or \
GearControl.CheckGearNeu or GearControl.GNeuError or \
GearControl.ReqSyncSpeed or \
GearControl.CheckSyncSpeed or GearControl.ReqSetGear or \
GearControl.CheckGearSet1 or GearControl.GSetError ) )

/*

*/
A[] ( GearBox.Idle imply \
( GearControl.ClutchClose or \
GearControl.CheckClutchClosed or \
GearControl.CCloseError or \
GearControl.ReqTorqueC or GearControl.GearChanged or \
GearControl.Gear or GearControl.Initiate or \
GearControl.CheckTorque or GearControl.ReqNeuGear or \
GearControl.CheckClutch2 or GearControl.COpenError or \
GearControl.ClutchOpen2 ) )

/*

*/
A[] ( GearBox.Neutral imply \
( GearControl.ReqSetGear or \
GearControl.CheckClutchClosed2 or \
GearControl.CCloseError or GearControl.ReqTorqueC or \
GearControl.GearChanged or GearControl.Gear or \
GearControl.Initiate or GearControl.ReqSyncSpeed or \
GearControl.CheckSyncSpeed or GearControl.ReqSetGear or \
GearControl.CheckClutch or GearControl.COpenError or \
GearControl.ClutchOpen or GearControl.ReqSetGear2 ) )

/*

*/
A[] ( Engine.Torque imply Clutch.Closed )

/*

*/
A[] ( 1 > 0 )
