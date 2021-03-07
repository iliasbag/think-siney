//think siney

//Play bad 3 times to create rhythmic pattern, until siney birds
(
SynthDef.new(\bad, {
	arg freq = 314, amp=0.628, env_rate=0.942;
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(
		Env.perc(releaseTime:0.2),
		LFSaw.kr(env_rate)
	);
	sig = sig*env;
	sig = sig+FreeVerb.ar(sig, 1, 0.95, 0.1, 0.4);
	sig = sig * amp;
	sig = sig!2;
	Out.ar(0, sig);
}).add;
)

Synth(\bad, [\freq, exprand(200,2000), \env_rate, rrand(0.4,1.2), \amp, 0.314]);


//enter siny granulation
(
SynthDef.new(\bad, {
	arg freq = 314, amp=0.628, env_rate=0.942;
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(
		Env.perc(releaseTime:0.2),
		LFSaw.kr(env_rate)
	);
	sig = sig*env;
	sig = sig+FreeVerb.ar(sig, 1, 0.95, 0.1, 0.4);
	sig = sig * amp;
	sig = sig!2;
	Out.ar(0, sig);
}).add;
)
(
14.do{
	Synth(\bad, [\freq, exprand(203.14,2026.8), \env_rate, rrand(0.4,1.2), \amp, 0.314]);
};
)


//add siney hyper - granulation
(
SynthDef.new(\bad, {
	arg freq = 314, amp=0.628, env_rate=0.942;
	var sig, env;
	sig = SinOsc.ar(freq);
	env = EnvGen.kr(
		Env.perc(releaseTime:0.2),
		LFSaw.kr(env_rate)
	);
	sig = sig*env;
	sig = sig+FreeVerb.ar(sig, 1, 0.95, 0.1, 0.4);
	sig = sig * amp;
	sig = sig!2;
	Out.ar(0, sig);
}).add;
)
(
44.do{
	Synth(\bad, [\freq, exprand(203.14,2026.8), \env_rate, rrand(0.4,1.2), \amp, 0.1314]);
};
)


//stop all, and play siney birds
//siney birds -
(
{
t = Impulse.kr(5);
o = SinOsc.ar(TRand.kr(2000, 4000, t), mul: EnvGen.kr(Env.perc(0.001, 0.1), t))*0.1;
Mix.ar(Pan2.ar(
CombL.ar(o, 2.0,
Array.fill(5, {rrand(0.2, 1.9)})
),
Array.fill(5, {1.0.rand2}) ));
}.play )


//enter earthy glide - Pitched, Percussive n Boomy
~perc1 = {|function, waitTime = 100|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~perc1.({
SinOsc.ar(
100 * LFNoise1.kr(1/6, 0.2, 1), mul: EnvGen.kr(
Env.perc(0, (100**(-0.7))*100), Dust.kr(1))
)!2 });

// performance on X-Y Axis
p = (
{ PMOsc.ar(
LFNoise1.kr(
MouseX.kr([1, 1], 12), mul: MouseY.kr(10, 1000), add: 1000),
LFNoise0.kr(
MouseX.kr([1, 1], 12), mul: MouseY.kr(30, 1000), add: 1000),
MouseY.kr(0.1, 5.0),
   mul: 0.2)
}.play
)
p.free


// thoughts play along with earthy glide
t = {SinOsc.ar(LFNoise2.ar([0, 1 ], 155, 160), 2.68, 0.314)}.play

t.free




//stop all,  add and play all rows, from a1 to a3b
//additive and siney
//~A1
	~a1 = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~a1.({max(0, SinOsc.ar(56, 0, 0.5)!2)}
);
//~A2
~a2 = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~a2.({max(0, SinOsc.ar(123, 0, 0.5)!2)}
);

//~E2
~e2 = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~e2.({max(0, SinOsc.ar(166, 0, 0.5)!2)}
);

//~A3
~a3 = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~a3.({max(0, SinOsc.ar(221, 0, 0.5)!2)}
);
//~E3
~e3 = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~e3.({max(0, SinOsc.ar(328, 0, 0.5)!2)}
);

//~A1 dissonance
~a1b = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~a1b.({max(0, SinOsc.ar(54, 0, 0.5)!2)}
);
//~E2 dissonant
~e2b = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~e2b.({max(0, SinOsc.ar(163, 0, 0.5)!2)}
);
//~A3 dissonant
~a3b = {|function, waitTime = 6|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~a3b.({max(0, SinOsc.ar(217, 0, 0.5)!2)}
);


//play G3, A2, E3 and Bb2 - FilteredSawtooth
//G3
g = {
RLPF.ar(
Saw.ar(196, 0.45),
		SinOsc.ar(0.2, 0, 890, 1089)!2
)
}.play
//A2
f = {
RLPF.ar(
Saw.ar(110, 0.55),
		SinOsc.ar(0.4, 0, 890, 1089)!2
)
}.play
//E3
h = {
RLPF.ar(
Saw.ar(164.5, 0.35),
		SinOsc.ar(0.2, 0, 890, 1089)!2
)
}.play
//Bb2
i = {
RLPF.ar(
Saw.ar(116.5, 0.5),
		SinOsc.ar(0.4, 0, 890, 1089)!2
)
}.play
//free at g and f
g.free
f.free
h.free
i.free

//Blend b in the mix, create a rhythmic pattern repeating b a few times
b = {PMOsc.ar(131.4, 226.8, 3.14, mul: EnvGen.kr(Env.perc(0, 0.628), Impulse.kr(1)))!2}.play
b.free

//wind
w = {PinkNoise.ar * max(0, LFNoise1.ar([10, 1]))}.play
w.free

//background noise
~wind1 = {|function, waitTime = 60|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~wind1.({max(0, LFNoise1.ar)!2}
);
//high pitches
~high1 = {|function, waitTime = 12|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};
~high1.({max(0, SinOsc.ar(583, 0, 0.3)!2)}
);

~high2 = {|function, waitTime = 11|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};
~high2.({max(0, SinOsc.ar(659, 0, 0.3)!2)}
);



a = {SinOsc.ar(SinOsc.ar(MouseX.kr(340, 800), mul: 100, add: 700)!2)}.play
a.free

//kill all and play percbass

//Pitched, Percussive n Boomy Bass
~percbass = {|function, waitTime = 25|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~percbass.({
SinOsc.ar(
100 * LFNoise1.kr(1/6, 0.4, 1), mul: EnvGen.kr(
Env.perc(0, (100**(-0.7))*100), Dust.kr(1))
)!2 });

~a12 = {|function, waitTime = 35|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~a12.({SinOsc.ar(SinOsc.ar(MouseX.kr(314, 536), mul: 200, add: 960)!2)}
);


//Ending wave, stop with perc1
~a1b = {|function, waitTime = 40|
    fork {
		x = function.play;
        waitTime.wait;
        x.free;
    }
};

~a1b.({max(0, SinOsc.ar(54, 0, 0.5)!2)}
);
