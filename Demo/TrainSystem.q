//This file was generated from (Commercial) UPPAAL 4.0.15 rev. CB6BB307F6F681CB, November 2019

/*

*/
A[] not deadlock

/*

*/
A[] (gate.Occ or gate.add1) imply gate.len > 0

/*

*/
A[] gate.list[N] == 0

/*
There is not more than one train crossing the bridge at any time. This expression uses the fact that Train1.Cross evaluates to true or false, i.e., 1 or 0.
*/
A[] t0.Cross+t1.Cross+t2.Cross+t3.Cross<=1

/*
is similar to the previous property, with all the other trains waiting to cross
the bridge. We have similar properties for the other trains.
*/
E<> t0.Cross && t1.Stop && t2.Stop && t3.Stop

/*
train 1 can be crossing the bridge
while train 2 is waiting to cross. We check for similar properties for the
other trains.
*/
E<> t1.Cross and t2.Stop

/*
train 1 can cross the bridge.We check similar properties
for the other trains.
*/
E<> t1.Cross

/*
the gate can receive and store messages from approaching trains in the queue.
*/
E<> gate.Occ
