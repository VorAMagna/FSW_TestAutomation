----
Author: Vladimir Vojnic Hajduk

Email: Vladimir.Vojnic-Hajduk@magna.com

MKS/Git user: vladvojn
----

## Instructions for setting up the development environment

### Installed Software development software:
- Pycharm
- Visual Studio Code
- git 
- python 3.6

### Setting up the git repos
The main git repo, whereever it may be. You want to pull it.

``` bat
git clone [url to repo] .
```

You also need the mks_api as a dependency.
At the time of writing, it's used as a git submodule.

``` bat
git submodule add [url to mks_api] mks_api
``` 

You can check `.gitmodules` to see if it's configured correctly.

Inside it should look like this
```
[submodule "mks_api"]
	path = mks_api
	url = [url to repo]
```

### Setting up the virtual environments: 
Download and install python 3.6.6 and install.

You shouldn't add it to your path to avoid conflicts.

Go the root of where you installed your python. And
``` bat
C:\OtherPrograms\python3.6> Scripts\pip install virtualenv
```
To install the virtual environment module for that particular python instance.

We are specifically using python 3.6 as it's the last supported python
version which works with the matlab2017b python engine.

From your project root dir you can now setup a fresh virtual environment.

``` bat
C:\Sandbox\Product_Group\SW\Development\FSW_Tools\FSW_TestAutomation> PYTHON_3_6_INSTALL_ROOT\Scripts\virtualenv.exe venv 
```

Whenever working with the virualenv you have to activate it before
executing the scripts\main.py in this project.

Start the virtual env with
``` bat
> .\venv\Scripts\activate
```

NOTE: You can setup vscode and pycharm to start in this
venv whenever its in the root dir.

For vscode:
Make  a `.vscode` folder, inside a `settings.json` file.
```
{
    "python.pythonPath": "venv\\Scripts\\python.exe",
}
```
It should look like that.

Pycharm should realize automatically to use a the venv. If not.
Look it up on the internet!

### Installing the dependencies
The dependencies are listed in `PROJ_ROOT\requirements.txt`. If in case
that doesn't exist. Here is the list as of 2020_12_09

``` txt
jdcal==1.4.1
openpyxl==3.0.5
psutil==5.7.2
retrying==1.3.3
six==1.15.0
tqdm==4.50.2
xmltodict==0.12.0
```
paste that into a `requirements.txt` file and then from the virtual
environment do

``` bat
pip install -r requirements.txt
```
to install the dependencies.

And that's it. Now you have everything required to run the scripts.
## Configuration to run on a machine.

`PROJ_ROOT\global_config.py` will hold all the the relevant parameters to configure.
Check all the variables there, see if the paths align with where the stuff is installed on your machine.

Expanding to a local_config.json could a sensible step.
Since I never deployed to more than 1 machine, I never had the need.


## Configuring the projects where to run
The file defined in `global_config.py` under `INPUT_GLOBAL_ROUTINE` will be used as the the source for the projects and modules which are to be tested.

If it wasn't changed by when you are reading this the projects configured
should be in `PROJ_ROOT\prep_run_stage\models_to_be_checked_routine.json`

The file strucutre in the `json` is a json array with each element
being an object with the following properties.

``` json
{
    "name": "name", // the identifier name of the run should lay here
    // runs which start with the substring "ROUTINE__" will be not be
    // removed after they are finished, but put on the end of the list.
    "modelpath": [
        "C:\\component\\model1.mdl",
        "C:\\component\\model2.mdl"
    ], // array of model paths which are going to be tested
    "sync" : [
        "C:\\component"
    ], // array of paths which should be synchronized before
    // this works recursively. 
    // you should synchronize all of the model files
    // and anything they depend on so the newest versions are tested

    "debug_flags" = { // this is optional, but can be set
    // if you are debuging or redoing a run
    // or if the reports are bad
    // and you want to overwrite them 

        "override_diff": true,  // when set to true
        // will check every model reguardless of the report
        // being up to date or not

        "override_commit": true // will check in the report
        // to mks reguardless if the previously checked one is up
        // to date or not
    }
}

```
### Setting up configs
You can set the configs up by hand if you like pain. 

If that's not the case then there is a small utility script under
`PROJ_ROOT\scripts\find_modules.py`, you can play around with it. 
You can set the variable `SEARCH_CONFIG` so it searches it for modules.
When you call the script.

It's going to search for modules in the given search config 
and output a generated config on stdout.

A workflow for configuring a new component would be for instance.
be setting search config:

``` python
SEARCH_CONFIG = [
    (r"C:\Sandbox\Product_Group_DS_devbranch\dp_Product_Group_DS_CC_5_6_0\SW\Development\CC", "ROUTINE__P_G_DS_devbranch_5_6_0_CC")
]
```
and then activating it 

``` bat
python scripts\find_modules.py > found.json
```

Then looking over the generated json in `found.json` seeing 
if everything is alright and then adding it to the ``

## File structure
The project/pipeline is structured in stages.
To see how these interact with eachother you can look at the uml in
`PROJ_ROOT\docs\FswTestAutomationUML.drawio` you can open it with [draw.io](http://www.draw.io). (free online tool)


The python modules related to the individual stages are listed in their own folders.
eg. files related to the sync_stage are in `PROJ_ROOT\sync_stage`.


There are modules which are used by more than one stage. These are in their own
respective folders. Usually grouped by the functionality they provide.


eg. `PROJ_ROOT\matlab_layer` has all the functionality related to controlling
matlab processes and the matlab scripts which are called 


there is a scripts folder `PROJ_ROOT\scripts` there we have scripts
which are used now and then (cronjobs, utility scripts), they use the codebase
of the project but are not part of the main execution.


## main.py

`PROJ_ROOT\main.py` is the entry point to the testing pipeline. 
If you configured everything correctly it should run without a problem!


good luck comarade!

##  FAQ:

### What the pipeline can do:
Test modules under the server configuration we have in `Lannach` parse 
the xml reports, check in a translated json report and a generated xlsx report.


### What the pipeline can NOT do (as of the 2020_12_09):
Work with the MKS server in `St Valentin`. 

This is due to an unfinished part in the `mks_api` dependency which is
being developed inhouse. The server routing (knowing when to connect to the st valentin server
and adjusting the commands is unfinished).

A schema type system also needs to be build so that the high level abstraction 
knows how to act on each server. 


*However* this takes into consideration that were working with the FSW filestructure
in `Lannach`. 

Reguarding the filestructure. In `St Valentin`, the configruation part
which determines where the reports are saved (mostly the logic in 
`PROJ_ROOT\test_stage\setup_configuration.py`,
`PROJ_ROOT\test_stage\MxamArtifactPathGenerator.py` and `PROJ_ROOT\test_stage\MxamArtifactPathGenerator.py`) will need an adapter
for the `St Valentin` folderstructure


Error Handling MES_ERR_004:
install patch JMBridge (/docs)


