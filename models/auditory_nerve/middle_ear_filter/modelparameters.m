
%% Autogen parameters

mp.testFile = [mp.test_signals_path filesep 'auditory_nerve\m06ae.wav'];

mp.sim_prompts = 1;
mp.sim_verify = 1;
mp.simDuration = 5;
mp.nSamples = config.system.sampleClockFrequency * mp.simDuration;

mef_parameters;