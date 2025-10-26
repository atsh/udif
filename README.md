# udif
University Digital Implementationa Flow

This simplified VLSI flow enables students/teachers/researchers to quickly simulate, synthesize, place and route and signoff clean gds based on their RTL code, using gpdk045 or sky130 PDK using cadence toolchain.
Future update plan includes supporting open source and eda tools from other vendors.


# Dependencies:
1. GNU Make
2. python3
3. json5
4. Cadence xcelium, genus, innovus, quantus, tempus, pegasus
   (Requires paid licenses, not provided with this reporsitory, please contact cadence to acruire the required tools and licenses)


#Instructions:

# Cloning the git repository
	1. Open a terminal on your university's cadence server
	2. cd to your designated work directory (ask your instructor if unsure)
	3. git clone https://github.com/atsh/aiub_vlsi_impl_demo.git <your_clone_dir_name>
	4. cd <your_clone_dir_name>  

# Additional step for Instructors/CAD/IT department (Skip for students)
For Instuctors using this repository on their university servers, other than AIUB, they will need to update the follwing files:
	1. env.sh (update the correct paths for EDA tools, further instructions in the comment sectoin of env.sh)
	2. util/tech/gpdk045.tcl
	3. util/tech/sky130_cadence.tcl
	4. util/tech/sky130.tcl

# Intial Directory Setup
After the repo is cloned and you cd into it:
	1. source env.sh <your_project_name> 
	2. make setup

This will set your PROJECT variable and create a directory with same name as your PROJECT variable value (<your_project_name>) in the "projects" directory
 
	3. cd to projects/<your_project_name> directory

This will be your PROJECT_WORKING_DIRCTORY for your project.

You will see the following files and directories in your project directory:
rtl, tb, sim, constraints, floorplan, scripts, Makefile, manifest.json

The scripts directory contains the necessary scripts to run this flow, while the rest are empty for the user to populate.

# Frontend Simulation
After the setup is complete:
	1. Write and save your rtl files in the rtl directory
	2. Write and save your tb files in the tb directory
	3. Open manifest.json file and update the syn_top and sim_top name with your design top and testbench top name respectively 
	4. In the manifest.json file follow the instructions in comments to point your rtl, tb, constraints files (make sure to use correct json syntax)
	5. Make sure your DISPLAY environment variable is set correctly (ask your instructor if unsure)
	5. make sim

This will run xcelium simulation and generate waveform.

# Backend Synthesis
Once the simulation passes, the rtl is ready to go through synthesis.
	1. Write sdc file for your design
	2. Make synth

This will run synthesis with genus and generate the reports and gate level netlist.

# Backend PnR
After synthesis is complete and results are satisfactory, user may move to place and route:
	1. make pnr
	2. This will initiate innovus and stop for your to start floorplanning
	3. Follow the instructors guideline for floorplan
	4. Save the def/tcl/io files in floorplan directory
	5. Update the pointer to floorplan in project_setup.tcl (Look for PNR_FP vairables)
	6. make pnr

This time it will go through all the stages upto route and final db generation.
If there are aborts or errors please consult with your instructors.
Additionaly you can open an Issue on the github.

# Backend Signoff  

NOTE: Signoff stage is under construction. Please check github repo for update.

Please work with your instructor to make sure the pnr final db is eligile to go through signoff stages.

	1. make signoff (for all signoff checks)
	2. make lvs (to run Layout Vs Schematic with Pegasus)
	3. make drc (to run Design Rule Check with Pegasus)
	4. make lec (to run Logical Equivalence Check with conformal)
	5. make pex (to run parasitic extractions with quantus)
	6. make sta (to run Static Timing Analysis with tempus; this will run pex if not ran already)
	7. make ir (to run Power and IR analysis with voltus)
	

# Example Projects
There are two example projects included in the repo:
	1. alu32
	2. fifo
Please go through the README.md file in each project directory for details.
