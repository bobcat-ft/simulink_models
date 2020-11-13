%% Autogen parameters
mp.sim_prompts = 1;
mp.sim_verify  = 1;
mp.simDuration = 5;
mp.nSamples    = config.system.sampleClockFrequency * mp.simDuration;

mp.testFile            = [mp.test_signals_path filesep 'auditory_nerve\c1_chirp_filter_out.wav'];
mp.testFile2           = [mp.test_signals_path filesep 'auditory_nerve\c2_wbf_out.wav'];
testSignal2            = AudioSource.fromFile(mp.testFile2, mp.Fs, mp.nSamples);
avalonSource2          = testSignal2.toAvalonSource();
mp.avalonSim2          = avalonSource2.astimeseries();
mp.Avalon_Source_Data2 = mp.avalonSim2.data;

%% ANM Settings
cf = 1000;    % Characteristic frequency of specific neuron
Fs = 48e3;    % Sampling frequency
tdres = 1/Fs; % Binsize in seconds
nrep = 100;   % Number of repititions for peri-stimulus time histogram

% Impairment constants
cohc = 1; 
cihc = 1; 

%% Inner Hair Cell Parameters
Fcihc    = 3000;
gainihc  = 1.0;
orderihc = 7;
[corner, strength, ihcasym_c1, slope_c1, ihcasym_c2, slope_c2, IHCLPcoeffs] = inner_hair_cell_parameters(tdres, Fcihc, gainihc);