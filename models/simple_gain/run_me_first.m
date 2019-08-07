% Run_me_first
%
% This scripts sets up the computer environment parameters
% (directories, paths, tools, etc) that the model needs.  It places these
% parameters in the data structure SG, which is the model name initials.
% This setup is needed for the Matlab HDL Coder to generate VHDL code.
%
% Copyright 2019 Flat Earth Inc
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
% INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
% PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
% FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
% ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
% Ross K. Snider
% Flat Earth Inc
% 985 Technology Blvd
% Bozeman, MT 59718
% support@flatearthinc.com

%% Clear the workspace
clear all   % clear all workspace variables
close all   % close all open Matlab windows
clc         % clear command window

%% Determine computer platform
if ispc
    platform_selection  = 1;  % 1=Windows                                              
elseif isunix
    platform_selection  = 2;  % 2=Linux                                          
elseif ismac
    platform_selection  = 3;  % 3=mac  (not currently used)                                                
else
    disp('Computer Platform not supported')
end

%% Fast simulation
% Fast simulation reduces the Fs_system clock rate to reduce the number of
% simulated clock cycles between each sample in the Avalon bus signals.
% It also reduces the number of stimulus samples.  This allow for faster
% development iterations when developing the simulink model.
mp.fastsim_flag        = 1;     % perform fast simulation  Note: fast simulation will be turned off when generating VHDL code since we need to run at the system clock rate.
mp.fastsim_Fs_system_N = 2;     % (typical value 2 or 4) Simulate a much slower system clock than what is specified in sm_callback_init.m   - The reduce rate will be a multiple of the sample rate, i.e. mp.Fs_system = mp.Fs*mp.fastsim_Fs_system_N
mp.fastsim_Nsamples    = 12000; % set to the string 'all' to use all the samples from the input signal specified in sm_init_test_signals.m


%% Setup the directory paths & tool settings
% Model variables will be placed in a data structure called mp 
% (<model_abbreviation>_params)that can be passed to functions
mp.model_name           = 'simple_gain';                                       % model name initials
mp.model_abbreviation   = 'SG';                                                % model initials
mp.linux_device_version = '18.0';                                              % string that describes device version (typically set as Quartus version)
switch platform_selection
    case 1
        mp.model_path           = 'E:\git\nih_simulinklib\models\simple_gain';         % path to the model directory
        mp.test_signals_path    = 'E:\git\nih_simulinklib\test_signals';               % path to test signals folder
        mp.utility_path         = 'E:\git\nih_simulinklib\matlab';                     % path to matlab utility functions folder
        mp.config_path          = 'E:\git\nih_simulinklib\config';                     % path to \configuration folder (widget and register field definitions)
        mp.codegen_path         = 'E:\git\nih_simulinklib\utilities\vhdl_codegen';     % path to \vhdl_codegen folder
    case 2
        mp.model_path           = pwd;                                         % path to the model directory
        mp.test_signals_path    = [pwd filesep 'test_signals'];                % path to test signals folder
        mp.utility_path         = [pwd filesep 'matlab'];                      % path to matlab utility functions folder
        mp.config_path          = [pwd filesep 'config'];                      % path to configuration folder (widget and register field definitions)
        mp.codegen_path         = [pwd filesep 'utilities\vhdl_codegen'];      % path to \vhdl_codegen folder
end
mp.quartus_project_path = 'E:\NIH\Simulink\Simple_Gain\Quartus_Project';       % path to the Quartus project directory for the Simulink model
mp.quartus_exe_path     = 'F:\intelFPGA_lite\18.0\quartus\bin64\quartus.exe';  % path to the Quartus executable
mp.python_path          = 'F:\Python\Python37\python.exe';                     % path to Python executable.
mp.linux_device_name    = mp.model_name;                                       % device driver name that Linux will see

%% Set up the paths
% Note: addpath() only sets the paths for the current Matlab session
addpath(mp.model_path)
addpath(mp.utility_path)
addpath(mp.codegen_path)
addpath(mp.config_path)
hdlsetuptoolpath('ToolName', 'Altera Quartus II', 'ToolPath', mp.quartus_exe_path);  % setup the HDL toochain path that needs to be set before calling HDL workflow process
eval(['cd ' mp.model_path])  % change the working directory to the model directory

%% python
[python_version, python_exe, python_loaded] = pyversion;
if  python_loaded
    disp(['Using Python version ' python_version])
else
    pyversion(mp.python_path);    % Note: if the version changes from what is already loaded in Matlab, you will need to restart Matlab
    [python_version, python_exe, python_loaded] = pyversion;
    disp(['Setting Python to version ' python_version])
end
% add the codegen_path to python's search path
if count(py.sys.path,mp.codegen_path) == 0
    insert(py.sys.path,int32(0),mp.codegen_path);
end


%% Open the model
disp(['Please wait while the Simulink Model: '  mp.model_name  ' is being opened.'])
disp(['Note: Before generating VHDL, you will need to run a model simulation.'])
open_system([mp.model_abbreviation])
% display popup reminder message 
helpdlg(sprintf(['NOTE: You will need to first run the Simulation for model ' mp.model_name ' to initialize variables in the Matlab workspace before converting to VHDL.']),'Reminder Message')
mp.sim_prompts = 1;  % turn on the simulation prompts/comments (these will be turned off when the HDL conversion process starts).
