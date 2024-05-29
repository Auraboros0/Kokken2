class Animations {
  Animation animations [];
  int currentAnimation;
  int characterselect;

  Animations () {
    characterselect = 0;
    currentAnimation = 0;
    animations = new Animation [200];
    //Jin Animations
    animations[0] = new Animation();
    animations[0].addPic("JinIdle1.png");
    animations[0].addPic("JinIdle2.png");
    animations[0].addPic("JinIdle3.png");
    animations[0].addPic("JinIdle4.png");
    animations[0].addPic("JinIdle5.png");
    animations[1] = new Animation();
    animations[1].addPic("JinPunch1.png");
    animations[1].addPic("JinPunch2.png");
    animations[1].addPic("JinPunch3.png");
    animations[1].addPic("JinPunch4.png");
    animations[2] = new Animation();
    //animations[2].addPic("JinCrouch1.png");
    animations[2].addPic("JinCrouch2.png");
    //animations[2].addPic("JinCrouch3.png");
    animations[3] = new Animation();
    animations[3].addPic("JinCrouchPunch1.png");
    animations[3].addPic("JinCrouchPunch2.png");
    animations[3].addPic("JinCrouchPunch3.png");
    animations[3].addPic("JinCrouchPunch4.png");
    animations[4] = new Animation();
    animations[4].addPic("JinFJump1.png");
    animations[4].addPic("JinFJump2.png");
    animations[4].addPic("JinFJump3.png");
    animations[4].addPic("JinFJump4.png");
    animations[4].addPic("JinFJump5.png");
    animations[5] = new Animation();
    animations[5].addPic("JinBJump1.png");
    animations[5].addPic("JinBJump2.png");
    animations[5].addPic("JinBJump3.png");
    animations[5].addPic("JinBJump4.png");
    animations[5].addPic("JinBJump5.png");
    animations[5].addPic("JinBJump6.png");
    animations[6] = new Animation();
    animations[6].addPic("JinJump1.png");
    animations[6].addPic("JinJump2.png");
    animations[6].addPic("JinJump3.png");
    animations[6].addPic("JinJump4.png");
    animations[6].addPic("JinJump5.png");
    animations[7] = new Animation();
    animations[7].addPic("JinCrouchKick1.png");
    animations[7].addPic("JinCrouchKick2.png");
    animations[7].addPic("JinCrouchKick3.png");
    animations[7].addPic("JinCrouchKick4.png");
    animations[7].addPic("JinCrouchKick5.png");
    animations[7].addPic("JinCrouchKick6.png");
    animations[7].addPic("JinCrouchKick7.png");
    animations[8] = new Animation();
    animations[8].addPic("JinLowKick1.png");
    animations[8].addPic("JinLowKick2.png");
    animations[8].addPic("JinLowKick3.png");
    animations[8].addPic("JinLowKick4.png");
    animations[8].addPic("JinLowKick5.png");
    animations[8].addPic("JinLowKick6.png");
    animations[8].addPic("JinLowKick7.png");
    animations[9] = new Animation();
    animations[9].addPic("JinKick1.png");
    animations[9].addPic("JinKick2.png");
    animations[9].addPic("JinKick3.png");
    animations[9].addPic("JinKick4.png");
    animations[9].addPic("JinKick5.png");
    animations[9].addPic("JinKick6.png");
    animations[10] = new Animation();
    animations[10].addPic("JinBlock1.png");
    animations[10].addPic("JinBlock2.png");
    animations[11] = new Animation();
    animations[11].addPic("JinCrouchBlock1.png");
    animations[11].addPic("JinCrouchBlock2.png");
    animations[12] = new Animation();
    animations[12].addPic("JinHurt1.png");
    animations[12].addPic("JinHurt2.png");
    animations[12].addPic("JinHurt3.png");
    animations[13] = new Animation();
    animations[13].addPic("JinCrouchHurt1.png");
    animations[13].addPic("JinCrouchHurt2.png");
    animations[13].addPic("JinCrouchHurt3.png");
    animations[14] = new Animation();
    animations[14].addPic("JinAirHurt1.png");
    animations[14].addPic("JinAirHurt2.png");
    animations[14].addPic("JinAirHurt3.png");
    animations[14].addPic("JinAirHurt4.png");
    animations[14].addPic("JinAirHurt5.png");
    animations[15] = new Animation();
    animations[15].addPic("JinBackUp1.png");
    animations[15].addPic("JinBackUp2.png");
    animations[15].addPic("JinBackUp3.png");
    animations[15].addPic("JinBackUp4.png");
    animations[15].addPic("JinBackUp5.png");
    animations[16] = new Animation();
    animations[16].addPic("JinHado1.png");
    animations[16].addPic("JinHado2.png");
    animations[16].addPic("JinHado3.png");
    animations[16].addPic("JinHado4.png");
    animations[17] = new Animation();
    animations[17].addPic("JinHighPunch1.png");
    animations[17].addPic("JinHighPunch2.png");
    animations[17].addPic("JinHighPunch3.png");
    animations[17].addPic("JinHighPunch4.png");
    animations[17].addPic("JinHighPunch5.png");
    animations[18] = new Animation();
    animations[18].addPic("JinDP1.png");
    animations[19] = new Animation();
    animations[19].addPic("JinDP2.png");
    animations[19].addPic("JinDP3.png");
    animations[19].addPic("JinDP4.png");
    animations[19].addPic("JinDP5.png");
    animations[19].addPic("JinDP6.png");
    animations[19].addPic("JinDP7.png");
    animations[19].addPic("JinDP8.png");
    animations[19].addPic("JinDP9.png");
    animations[19].addPic("JinDP10.png");
    animations[19].addPic("JinDP11.png");
    animations[19].addPic("JinDP12.png");
    animations[19].addPic("JinDP13.png");
    animations[19].addPic("JinDP14.png");
    animations[19].addPic("JinDP15.png");
    animations[41] = new Animation();
    animations[41].addPic("JinDP16.png");
    animations[42] = new Animation();
    animations[42].addPic("JinForwardDash1.png");
    animations[42].addPic("JinForwardDash2.png");
    animations[42].addPic("JinForwardDash3.png");
    animations[42].addPic("JinForwardDash4.png");
    animations[42].addPic("JinForwardDash5.png");
    animations[42].addPic("JinForwardDash6.png");
    animations[43] = new Animation();
    animations[43].addPic("JinAirHurt5.png");
    animations[44] = new Animation();
    animations[44].addPic("JinAirHurt1.png");
    animations[45] = new Animation();
    animations[45].addPic("JinAirHurt2.png");
    // Jin idle
    animations[50] = new Animation();
    animations[50].addPic("JinIdle1.png");
    animations[50].addPic("JinIdle2.png");
    animations[50].addPic("JinIdle3.png");
    animations[50].addPic("JinIdle4.png");
    animations[50].addPic("JinIdle5.png");
    // Jin standLP
    animations[51] = new Animation();
    animations[51].addPic("JinPunch1.png");
    animations[52] = new Animation();
    animations[52].addPic("JinPunch2.png");
    animations[52].addPic("JinPunch3.png");
    animations[53] = new Animation();
    animations[53].addPic("JinPunch4.png");
    // Jin standLK
    animations[54] = new Animation();
    animations[54].addPic("JinLowKick1.png");
    animations[54].addPic("JinLowKick1.png");
    animations[54].addPic("JinLowKick2.png");
    animations[54].addPic("JinLowKick2.png");
    animations[54].addPic("JinLowKick3.png");
    animations[54].addPic("JinLowKick3.png");
    animations[54].addPic("JinLowKick4.png");
    animations[54].addPic("JinLowKick4.png");
    animations[55] = new Animation();
    animations[55].addPic("JinLowKick5.png");
    animations[56] = new Animation();
    animations[56].addPic("JinLowKick6.png");
    animations[56].addPic("JinLowKick6.png");
    animations[56].addPic("JinLowKick7.png");
    animations[56].addPic("JinLowKick7.png");
    // Jin idle
    animations[50] = new Animation();
    animations[50].addPic("JinIdle1.png");
    animations[50].addPic("JinIdle2.png");
    animations[50].addPic("JinIdle3.png");
    animations[50].addPic("JinIdle4.png");
    animations[50].addPic("JinIdle5.png");

    // Jin standLP
    animations[51] = new Animation();
    animations[51].addPic("JinPunch1.png");
    animations[52] = new Animation();
    animations[52].addPic("JinPunch2.png");
    animations[52].addPic("JinPunch3.png");
    animations[53] = new Animation();
    animations[53].addPic("JinPunch4.png");

    // Jin standLK
    animations[54] = new Animation();
    animations[54].addPic("JinLowKick1.png");
    animations[54].addPic("JinLowKick1.png");
    animations[54].addPic("JinLowKick2.png");
    animations[54].addPic("JinLowKick2.png");
    animations[54].addPic("JinLowKick3.png");
    animations[54].addPic("JinLowKick3.png");
    animations[54].addPic("JinLowKick4.png");
    animations[54].addPic("JinLowKick4.png");
    animations[55] = new Animation();
    animations[55].addPic("JinLowKick5.png");
    animations[56] = new Animation();
    animations[56].addPic("JinLowKick6.png");
    animations[56].addPic("JinLowKick6.png");
    animations[56].addPic("JinLowKick7.png");
    animations[56].addPic("JinLowKick7.png");


    // Jin standHP
    animations[57] = new Animation();
    animations[57].addPic("JinBlock2.png");
    animations[57].addPic("JinBlock2.png");
    animations[57].addPic("JinBlock2.png");
    animations[57].addPic("JinHighPunch1.png");
    animations[57].addPic("JinHighPunch1.png");
    animations[57].addPic("JinHighPunch1.png");
    animations[58] = new Animation();
    animations[58].addPic("JinHighPunch2.png");
    animations[58].addPic("JinHighPunch2.png");
    animations[58].addPic("JinHighPunch3.png");
    animations[58].addPic("JinHighPunch3.png");
    animations[59] = new Animation();
    animations[59].addPic("JinHighPunch4.png");
    animations[59].addPic("JinHighPunch4.png");
    animations[59].addPic("JinHighPunch4.png");
    animations[59].addPic("JinHighPunch4.png");
    animations[59].addPic("JinHighPunch5.png");
    animations[59].addPic("JinHighPunch5.png");
    animations[59].addPic("JinHighPunch5.png");
    // Jin standHK
    animations[60] = new Animation();
    animations[60].addPic("JinLowKick1.png");
    animations[60].addPic("JinLowKick1.png");
    animations[60].addPic("JinLowKick1.png");
    animations[60].addPic("JinKick1.png");
    animations[60].addPic("JinKick1.png");
    animations[60].addPic("JinKick1.png");
    animations[60].addPic("JinKick1.png");
    animations[60].addPic("JinKick2.png");
    animations[60].addPic("JinKick2.png");
    animations[60].addPic("JinKick2.png");
    animations[61] = new Animation();
    animations[61].addPic("JinKick3.png");
    animations[62] = new Animation();
    animations[62].addPic("JinKick4.png");

    // Jin Hado
    animations[63] = new Animation();
    animations[63].addPic("JinHado1.png");
    animations[63].addPic("JinHado1.png");
    animations[63].addPic("JinHado1.png");
    animations[63].addPic("JinHado1.png");
    animations[63].addPic("JinHado1.png");
    animations[63].addPic("JinHado1.png");
    animations[63].addPic("JinHado1.png");
    animations[63].addPic("JinHado2.png");
    animations[63].addPic("JinHado2.png");
    animations[63].addPic("JinHado2.png");
    animations[63].addPic("JinHado2.png");
    animations[63].addPic("JinHado2.png");
    animations[63].addPic("JinHado2.png");
    animations[63].addPic("JinHado2.png");
    animations[64] = new Animation();
    animations[64].addPic("JinHado3.png");
    animations[64].addPic("JinHado3.png");
    animations[65] = new Animation();
    animations[65].addPic("JinHado4.png");

    // Jin Hado Projectile

    animations[66] = new Animation();
    animations[66].addPic("Projectile1.png");
    animations[66].addPic("Projectile2.png");
    animations[66].addPic("Projectile3.png");
    animations[66].addPic("Projectile4.png");


    // Jin DP

    animations[67] = new Animation();
    animations[67].addPic("JinDP1.png");
    animations[68] = new Animation();
    animations[68].addPic("JinDP2.png");
    animations[68].addPic("JinDP3.png");
    animations[68].addPic("JinDP5.png");
    animations[68].addPic("JinDP6.png");
    animations[68].addPic("JinDP7.png");
    animations[68].addPic("JinDP8.png");
    animations[68].addPic("JinDP9.png");
    animations[68].addPic("JinDP10.png");
    animations[68].addPic("JinDP11.png");
    animations[68].addPic("JinDP12.png");
    animations[68].addPic("JinDP13.png");
    animations[68].addPic("JinDP14.png");
    animations[69] = new Animation();
    animations[69].addPic("JinDP15.png");
    animations[70] = new Animation();
    animations[70].addPic("JinDP16.png");

    // Jin Walk/Dash

    animations[71] = new Animation();
    animations[71].addPic("JinForwardDash1.png");
    animations[71].addPic("JinForwardDash2.png");
    animations[71].addPic("JinForwardDash3.png");
    animations[71].addPic("JinForwardDash4.png");
    animations[71].addPic("JinForwardDash5.png");
    animations[71].addPic("JinForwardDash6.png");

    // Jin Forward Jump

    animations[72] = new Animation();
    animations[72].addPic("JinFJump1.png");
    animations[72].addPic("JinFJump2.png");
    animations[72].addPic("JinFJump3.png");
    animations[72].addPic("JinFJump4.png");
    animations[73] = new Animation();
    animations[73].addPic("JinFJump5.png");

    // Jin Backwards Jump

    animations[74] = new Animation();
    animations[74].addPic("JinBJump1.png");
    animations[74].addPic("JinBJump2.png");
    animations[74].addPic("JinBJump3.png");
    animations[74].addPic("JinBJump4.png");
    animations[74].addPic("JinBJump5.png");
    animations[75] = new Animation();
    animations[75].addPic("JinBJump6.png");

    // Jin Crouch

    animations[76] = new Animation();
    animations[76].addPic("JinCrouch1.png");
    animations[77] = new Animation();
    animations[77].addPic("JinCrouch2.png");

    // Jin Ground Hurt

    animations[78] = new Animation();
    animations[78].addPic("JinHurt1.png");
    animations[79] = new Animation();
    animations[79].addPic("JinHurt2.png");
    animations[80] = new Animation();
    animations[80].addPic("JinHurt3.png");

    // Jin Crouch Hurt

    animations[81] = new Animation();
    animations[81].addPic("JinCrouchHurt1.png");
    animations[82] = new Animation();
    animations[82].addPic("JinCrouchHurt2.png");
    animations[83] = new Animation();
    animations[83].addPic("JinCrouchHurt3.png");

    // Jin Air Hurt

    animations[84] = new Animation();
    animations[84].addPic("JinAirHurt1.png");
    animations[85] = new Animation();
    animations[85].addPic("JinAirHurt2.png");
    animations[86] = new Animation();
    animations[86].addPic("JinAirHurt3.png");
    animations[86].addPic("JinAirHurt4.png");
    animations[87] = new Animation();
    animations[87].addPic("JinAirHurt5.png");

    // Jin Ukemi

    animations[88] = new Animation();
    animations[88].addPic("JinBackUp1.png");
    animations[88].addPic("JinBackUp2.png");
    animations[88].addPic("JinBackUp3.png");
    animations[88].addPic("JinBackUp4.png");
    animations[89] = new Animation();
    animations[89].addPic("JinBackUp5.png");

    // Jin Block

    animations[90] = new Animation();
    animations[90].addPic("JinBlock2.png");

    // Jin Crouch Block

    animations[91] = new Animation();
    animations[91].addPic("JinCrouchBlock2.png");

    // Jin Back Dash

    animations[92] = new Animation();
    animations[92].addPic("JinLowKick6.png");

    // Jin Air Punch

    animations[93] = new Animation();
    animations[93].addPic("JinAirPunch1.png");
    animations[93].addPic("JinAirPunch1.png");
    animations[93].addPic("JinAirPunch1.png");
    animations[93].addPic("JinAirPunch2.png");
    animations[93].addPic("JinAirPunch2.png");
    animations[93].addPic("JinAirPunch2.png");
    animations[94] = new Animation();
    animations[94].addPic("JinAirPunch3.png");
    animations[95] = new Animation();
    animations[95].addPic("JinAirPunch4.png");

    // Jin Air Kick

    animations[96] = new Animation();
    animations[96].addPic("JinAirKick1.png");
    animations[96].addPic("JinAirKick1.png");
    animations[96].addPic("JinAirKick1.png");
    animations[96].addPic("JinAirKick1.png");
    animations[96].addPic("JinAirKick1.png");
    animations[96].addPic("JinAirKick2.png");
    animations[96].addPic("JinAirKick2.png");
    animations[96].addPic("JinAirKick2.png");

    animations[97] = new Animation();
    animations[97].addPic("JinAirKick3.png");





    //Bobby Animations
    animations[20] = new Animation();
    animations[20].addPic("BobbyIdleF1.png");
    animations[20].addPic("BobbyIdleF2.png");
    animations[20].addPic("BobbyIdleF3.png");
    animations[20].addPic("BobbyIdleF4.png");
    animations[20].addPic("BobbyIdleF5.png");
    animations[21] = new Animation();
    animations[21].addPic("BobbyPunch1.png");
    animations[21].addPic("BobbyPunch2.png");
    animations[21].addPic("BobbyPunch3.png");
    animations[21].addPic("BobbyPunch4.png");
    animations[21].addPic("BobbyPunch5.png");
    animations[22] = new Animation();
    //animations[22].addPic("BobbyCrouch1.png");
    //animations[22].addPic("BobbyCrouch2.png");
    animations[22].addPic("BobbyCrouch3.png");
    //animations[22].addPic("BobbyCrouch4.png");
    //animations[22].addPic("BobbyCrouch5.png");
    animations[23] = new Animation();
    animations[23].addPic("BobbyCrouchMidPunch1.png");
    animations[23].addPic("BobbyCrouchMidPunch2.png");
    animations[23].addPic("BobbyCrouchMidPunch3.png");
    animations[23].addPic("BobbyCrouchMidPunch4.png");
    animations[23].addPic("BobbyCrouchMidPunch5.png");
    animations[24] = new Animation();
    animations[24].addPic("BobbyCrouchHighPunch1.png");
    animations[24].addPic("BobbyCrouchHighPunch2.png");
    animations[24].addPic("BobbyCrouchHighPunch3.png");
    animations[24].addPic("BobbyCrouchHighPunch4.png");
    animations[24].addPic("BobbyCrouchHighPunch5.png");
    animations[25] = new Animation();
    animations[25].addPic("BobbyCrouchKick1.png");
    animations[25].addPic("BobbyCrouchKick2.png");
    animations[25].addPic("BobbyCrouchKick3.png");
    animations[25].addPic("BobbyCrouchKick4.png");
    animations[25].addPic("BobbyCrouchKick5.png");
    animations[25].addPic("BobbyCrouchKick6.png");
    animations[25].addPic("BobbyCrouchKick7.png");
    animations[26] = new Animation();
    animations[26].addPic("BobbyFJump1.png");
    animations[26].addPic("BobbyFJump2.png");
    animations[26].addPic("BobbyFJump3.png");
    animations[26].addPic("BobbyFJump4.png");
    animations[26].addPic("BobbyFJump5.png");
    animations[26].addPic("BobbyFJump6.png");
    animations[26].addPic("BobbyFJump7.png");
    animations[26].addPic("BobbyFJump8.png");
    animations[26].addPic("BobbyFJump9.png");
    animations[26].addPic("BobbyFJump10.png");
    animations[26].addPic("BobbyFJump11.png");
    animations[27] = new Animation();
    animations[27].addPic("BobbyBJump1.png");
    animations[27].addPic("BobbyBJump2.png");
    animations[27].addPic("BobbyBJump3.png");
    animations[27].addPic("BobbyBJump4.png");
    animations[27].addPic("BobbyBJump5.png");
    animations[27].addPic("BobbyBJump6.png");
    animations[27].addPic("BobbyBJump7.png");
    animations[27].addPic("BobbyBJump8.png");
    animations[27].addPic("BobbyBJump9.png");
    animations[27].addPic("BobbyBJump10.png");
    animations[27].addPic("BobbyBJump11.png");
    animations[28] = new Animation();
    animations[28].addPic("BobbyJump1.png");
    animations[28].addPic("BobbyJump2.png");
    animations[28].addPic("BobbyJump3.png");
    animations[28].addPic("BobbyJump4.png");
    animations[28].addPic("BobbyJump5.png");
    animations[29] = new Animation();
    animations[29].addPic("BobbyLowKick1.png");
    animations[29].addPic("BobbyLowKick2.png");
    animations[29].addPic("BobbyLowKick3.png");
    animations[29].addPic("BobbyLowKick4.png");
    animations[29].addPic("BobbyLowKick5.png");
    animations[30] = new Animation();
    animations[30].addPic("BobbyBlock1.png");
    animations[30].addPic("BobbyBlock2.png");
    animations[31] = new Animation();
    animations[31].addPic("BobbyCrouchBlock1.png");
    animations[31].addPic("BobbyCrouchBlock2.png");
    animations[33] = new Animation();
    animations[33].addPic("BobbyBackUp1.png");
    animations[33].addPic("BobbyBackUp2.png");
    animations[33].addPic("BobbyBackUp3.png");
    animations[33].addPic("BobbyBackUp4.png");
    animations[33].addPic("BobbyBackUp5.png");
    animations[33].addPic("BobbyBackUp6.png");
    animations[33].addPic("BobbyBackUp7.png");
    animations[34] = new Animation();
    animations[34].addPic("BobbyHurt1.png");
    animations[34].addPic("BobbyHurt2.png");
    animations[34].addPic("BobbyHurt3.png");
    animations[35] = new Animation();
    animations[35].addPic("BobbyCrouchHurt1.png");
    animations[35].addPic("BobbyCrouchHurt2.png");
    animations[35].addPic("BobbyCrouchHurt3.png");
    animations[36] = new Animation();
    animations[36].addPic("BobbyHighPunch1.png");
    animations[36].addPic("BobbyHighPunch2.png");
    animations[36].addPic("BobbyHighPunch3.png");
    animations[36].addPic("BobbyHighPunch4.png");
    animations[36].addPic("BobbyHighPunch5.png");
    animations[37] = new Animation();
    animations[37].addPic("BobbyAirHurt1.png");
    animations[38] = new Animation();
    animations[38].addPic("BobbyAirHurt2.png");
    animations[39] = new Animation();
    animations[39].addPic("BobbyAirHurt5.png");

    animations[100] =new Animation();
    animations[100].addPic ("GuileIdle1.png", 120, 130);
    animations[100].addPic ("GuileIdle2.png", 120, 130);
    animations[100].addPic ("GuileIdle3.png", 120, 130);
    animations[100].addPic ("GuileIdle4.png", 120, 130);
    animations[100].addPic ("GuileIdle5.png", 120, 130);
    animations[100].addPic ("GuileIdle6.png", 120, 130);
  }

  // projectile
  //animations[100] = new Animation();
  //animations[100].addPic("Projectile1.png");
  //animations[100].addPic("Projectile2.png");
  //animations[100].addPic("Projectile3.png");
  //animations[100].addPic("Projectile4.png");

  void setAnimation(int ca) {
    if (currentAnimation == ca) {
      return;
    }
    currentAnimation = ca;
    animations[currentAnimation].currentFrame = 0;
  }

  void display(float x, float y, boolean left) {
    push();
    translate(x, y);
    scale(left ? -3 : 3, 3);
    //if (animations[currentAnimation] == animations[60]) {
    //  scale(left ? -3 :1.3, 1.3);
    //}
    animations[currentAnimation].display();
    pop();
  }
}
