// Gridfinity Stackable baseplate

// A -- 2025-02-02 -- Observations
//
// - "top" is hanging between layers at 5.80 and 7.2 mm
// - nut hole is too narrow (at 2.25mm)
// - screw hole is long enough for M3x30 bolts
//
// B -- 2025-02-03 -- Changes
//
// - project the top plate from 5.6mm to 7.2mm in height (so the bottom get
//   goes all the way to the top plate)
// - expand nut trap to 2.45mm thick (my M3 bolts measure at 2.32mm thick)
//
// C -- 2025-02-15 -- Changes
//
// - move exterior hole up (to allow for clean plate stacking)
// - swap to M2.5 hardware
// - add socket head "extra pocket"
//
// D -- 2025-02-16 -- Changes
//
// - interior block for screw to go into
// - corner holes for magnets


include <../libs/gridfinity_extended_openscad/modules/gridfinity_constants.scad>
use <../libs/gridfinity_extended_openscad/modules/module_gridfinity_cup.scad>
use <../libs/gridfinity_extended_openscad/modules/module_gridfinity.scad>

use <../libs/gridfinity_extended_openscad/modules/module_gridfinity_baseplate.scad>
use <../libs/gridfinity_extended_openscad/modules/module_gridfinity_baseplate_connectors.scad>


/* [WM Basic Settings] */

width_gf = 4;
depth_gf = 3;

// for M3 hardware, 3.3mm. Set to the nominal size of the hardware so that the threads will cut into the printed plastic, which we want.
screw_hole_diameter = 2.5;
// to go across the bin, set to 39mm
screw_hole_depth = 16;
// a M3 nut is nominally 5.5mm flat to flat; include clearance here (so 5.6mm?)
nut_split_fit_width = 5.0;
// a M3 nut is nominally 6.35mm across corners; include clearance here
nut_split_fit_width_corners = 5.55;
// a M3 nut is nominally 2.15mm thick, mine are 2.32mm; include clearance here (so 2.45mm?)
nut_split_fit_thickness = 2.05;
screw_socket_head_diameter = 4.5;
screw_socket_head_depth = 29.95;

// how far above the bottom the center of the screw hole is
screw_hole_height = 5.975;

// to adjust how much the nut is inside, from the outside walls of the baseplate (for M3, use 5.4mm?)
nut_set_inset = 5.01;

// this is the actual one we use to turn on and off magnet
magnets = true;  // [true, false]


/* [WM Adjusted Settings] */
height_gh = 1;
// Remove some or all of lip
lip_style = "none";  // [ normal, reduced, minimum, none:not stackable ]
// Enable magnets; set as "false"
enable_magnets = false; // [true, false]
// adding magnets will increase the baseplate height...need to adjust for this; set as "false" for now
baseplate_enable_magnets = false; // [true, false]
// Enable magnets in the baseplate corner
Enable_Magnets = baseplate_enable_magnets;
// Enable screws
enable_screws = false;
//size of magnet, diameter and height. Zack's original used 6.5 and 2.4
magnet_size = [6.2, 2.3];  // 0.1
// Minimum thickness above cutouts in base (Zack's design is effectively 1.2)
floor_thickness = 0.2;
// Add bin size to bin bottom
text_1 = true;
// Add free-form text line to bin bottom (printing date, serial, etc)
text_2 = true;
// Actual text to add
text_2_text = "0099D  M2.5      hardware";
// Font Size of text, in mm (0 will auto size)
text_size = 5.5; // 0.1
// Depth of text, in mm
text_depth = 0.3; // 0.01
label_style = "disabled"; // [disabled: no label, normal:normal, gflabel:gflabel basic label, pred:pred - labels by pred, cullenect:Cullenect click labels V2,  cullenect_legacy:Cullenect click labels v1]


/*<!!start gridfinity_basic_cup!!>*/
/* [General Cup] */
// X dimension. grid units (multiples of 42mm) or mm.
width = [width_gf, 0]; // 0.1
// Y dimension. grid units (multiples of 42mm) or mm.
depth = [depth_gf, 0]; // 0.1
// Z dimension excluding. grid units (multiples of 7mm) or mm.
height = [height_gh, 0]; // 0.1
// Fill in solid block (overrides all following options)
filled_in = "disabled"; //[disabled, enabled, enabledfilllip:"Fill cup and lip"]
// Wall thickness of outer walls. default, height < 8 0.95, height < 16 1.2, height > 16 1.6 (Zack's design is 0.95 mm)
wall_thickness = 0;  // 0.01

//under size the bin top by this amount to allow for better stacking
zClearance = 0; // 0.1

/* [Cup - Subdivisions] */
chamber_wall_thickness = 1.2;
//Reduce the wall height by this amount
chamber_wall_zClearance = 0;  // 0.1
// X dimension subdivisions
vertical_chambers = 1; 
vertical_separator_bend_position = 0;
vertical_separator_bend_angle = 0;
vertical_separator_bend_separation = 0;
vertical_separator_cut_depth=0;
horizontal_chambers = 1; 
horizontal_separator_bend_position = 0;
horizontal_separator_bend_angle = 0;
horizontal_separator_bend_separation = 0;
horizontal_separator_cut_depth=0;
// Enable irregular subdivisions
vertical_irregular_subdivisions = false;
// Separator positions are defined in terms of grid units from the left end
vertical_separator_config = "10.5|21|42|50|60";
// Enable irregular subdivisions
horizontal_irregular_subdivisions = false;
// Separator positions are defined in terms of grid units from the left end
horizontal_separator_config = "10.5|21|42|50|60";

/* [Cup - Base] */
//create relief for magnet removal
magnet_easy_release = "auto";//["off","auto","inner","outer"] 
//size of screw, diameter and height. Zack's original used 3 and 6
screw_size = [3, 6]; // 0.1
//size of center magnet, diameter and height. 
center_magnet_size = [0,0];
// Sequential Bridging hole overhang remedy is active only when both screws and magnets are nonzero (and this option is selected)
hole_overhang_remedy = 2;
//Only add attachments (magnets and screw) to box corners (prints faster).
box_corner_attachments_only = true;
cavity_floor_radius = -1;  // 0.1
// Efficient floor option saves material and time, but the internal floor is not flat
efficient_floor = "off";  // [off,on,rounded,smooth]
// Enable to subdivide bottom pads to allow half-cell offsets
half_pitch = false;
// Removes the internal grid from base the shape
flat_base = "off";  // [off, gridfinity:gridfinity stackable, rounded]
// Remove floor to create a vertical spacer
spacer = false;
//Pads smaller than this will not be rendered as it interferes with the baseplate. Ensure appropriate support is added in slicer.
minimum_printable_pad_size = 0.2;

// Adjust the radius of the rounded flat base. -1 uses the corner radius.
flat_base_rounded_radius = -1;
// Add chamfer to the rounded bottom corner to make easier to print. -1 add auto 45deg.
flat_base_rounded_easyPrint = -1;

/* [Cup - Label] */
// Include overhang for labeling (and specify left/right/center justification)
label_position = "left"; // [left, right, center, leftchamber, rightchamber, centerchamber]
// Width, Depth, Height, Radius. Width in Gridfinity units of 42mm, Depth and Height in mm, radius in mm. Width of 0 uses full width. Height of 0 uses Depth, height of -1 uses depth*3/4. 
label_size = [0,14,0,0.6]; // 0.01
// Size in mm of relief where appropriate. Width, depth, height, radius
label_relief = [0,0,0,0.6]; // 0.1
// wall to enable on, front, back, left, right. 0: disabled; 1: enabled;
label_walls=[0,1,0,0];  // [0:1:1]
    
/* [Cup - Sliding Lid] */
sliding_lid_enabled = false;
// 0 = wall thickness *2
sliding_lid_thickness = 0; // 0.1
// 0 = wall_thickness/2
sliding_min_wallThickness = 0;// 0.1
// 0 = default_sliding_lid_thickness/2
sliding_min_support = 0;  // 0.1
sliding_clearance = 0.1;  // 0.1
sliding_lid_lip_enabled = false;

/* [Cup - Finger Slide] */
// Include larger corner fillet
fingerslide = "none"; //[none, rounded, chamfered]
// Radius of the corner fillet
fingerslide_radius = 8;
// wall to enable on, front, back, left, right. 0: disabled; 1: enabled;
fingerslide_walls=[1,0,0,0];  //[0:1:1]
//Align the fingerslide with the lip
fingerslide_lip_aligned=true; 

/* [Cup - Tapered Corner] */
tapered_corner = "none"; //[none, rounded, chamfered]
tapered_corner_size = 10;
// Set back of the tapered corner, default is the gridfinity corner radius
tapered_setback = -1;//gridfinity_corner_radius/2;

/* [Cup - Wall Pattern] */
// Grid wall patter
wallpattern_enabled=false;
// Style of the pattern
wallpattern_style = "gridrotated"; //[grid, gridrotated, hexgrid, hexgridrotated, voronoi, voronoigrid, voronoihexgrid, brick, brickrotated, brickoffset, brickoffsetrotated]
// Spacing between pattern
wallpattern_hole_spacing = 2; //0.1
// wall to enable on, front, back, left, right.
wallpattern_walls=[1,1,1,1];  //[0:1:1]
// Add the pattern to the dividers
wallpattern_dividers_enabled="disabled"; //[disabled, horizontal, vertical, both] 
//Number of sides of the hole op
wallpattern_hole_sides = 6; //[4:square, 6:Hex, 64:circle]
//Size of the hole
wallpattern_hole_size = [5,5]; //0.1
//Radius of corners
wallpattern_hole_radius = 0.5;
// pattern fill mode
wallpattern_fill = "crop"; //[none, space, crop, crophorizontal, cropvertical, crophorizontal_spacevertical, cropvertical_spacehorizontal, spacevertical, spacehorizontal]
//voronoi: noise, brick: center weight, grid: taper
wallpattern_pattern_variable = 0.75;
//$fs for floor pattern, min size face.
wallpattern_pattern_quality = 0.4;//0.1:0.1:2

/* [Cup - Floor Pattern] */
// enable Grid floor patter
floorpattern_enabled=false;
// Style of the pattern
floorpattern_style = "gridrotated"; //[grid, gridrotated, hexgrid, hexgridrotated, voronoi, voronoigrid, voronoihexgrid, brick, brickrotated, brickoffset, brickoffsetrotated]
// Spacing between pattern
floorpattern_hole_spacing = 2; //0.1
//Number of sides of the hole op
floorpattern_hole_sides = 6; //[4:square, 6:Hex, 64:circle]
//Size of the hole
floorpattern_hole_size = [5,5]; //0.1
floorpattern_hole_radius = 0.5;
// pattern fill mode
floorpattern_fill = "crop"; //[none, space, crop, crophorizontal, cropvertical, crophorizontal_spacevertical, cropvertical_spacehorizontal, spacevertical, spacehorizontal]
//voronoi: noise, brick: center weight, grid: taper
floorpattern_pattern_variable = 0.75;
//$fs for floor pattern, min size face.
floorpattern_pattern_quality = 0.4;//0.1:0.1:2

/* [Cup - Wall Cutout] */
wallcutout_vertical ="disabled"; //[disabled, enabled, wallsonly, frontonly, backonly]
// wall to enable on, front, back, left, right. 0: disabled; Positive: GF units; Negative: ratio length/abs(value)
wallcutout_vertical_position=-2;  //0.1
//default will be binwidth/2
wallcutout_vertical_width=0;
wallcutout_vertical_angle=70;
//default will be binHeight
wallcutout_vertical_height=0;
wallcutout_vertical_corner_radius=5;
wallcutout_horizontal ="disabled"; //[disabled, enabled, wallsonly, leftonly, rightonly]
// wall to enable on, front, back, left, right. 0: disabled; Positive: GF units; Negative: ratio length/abs(value)
wallcutout_horizontal_position=-2;  //0.1
//default will be binwidth/2
wallcutout_horizontal_width=0;
wallcutout_horizontal_angle=70;
//default will be binHeight
wallcutout_horizontal_height=0;
wallcutout_horizontal_corner_radius=5;

/* [Cup - Extendable] */
extension_x_enabled = "disabled"; //[disabled, front, back]
extension_x_position = 0.5; 
extension_y_enabled = "disabled"; //[disabled, front, back]
extension_y_position = 0.5; 
extension_tabs_enabled = true;
//Tab size, height, width, thickness, style. width default is height, thickness default is 1.4, style {0,1,2}.
extension_tab_size= [10,0,0,0];

/* [Cup - Bottom Text] */

// Font to use
text_font = "Aldo";  // [Aldo, B612, "Open Sans", Ubuntu]






/* [ Baseplate - General ] */
// Plate Style
Base_Plate_Options = "default";//[default:Efficient base, cnclaser:CNC or Laser cut]
// X dimension. grid units (multiples of 42mm) or mm.
Width = width;
// Y dimension. grid units (multiples of 42mm) or mm.
Depth = depth;
oversize_method = "fill"; //[crop, fill]
position_fill_grid_x = "near";//[near, center, far]
position_fill_grid_y = "near";//[near, center, far]
// X outer dimension. grid units (multiples of 42mm) or mm.
outer_Width = [0, 0]; //0.1
// Y outer dimension. grid units (multiples of 42mm) or mm.
outer_Depth = [0, 0]; //0.1
// z outer dimension. mm.
outer_Height = 0; //0.1
position_grid_in_outer_x = "center";//[near, center, far]
position_grid_in_outer_y = "center";//[near, center, far]
//Reduce the frame wall size to this value
Reduced_Wall_Height = 0; //0.1
Reduced_Wall_Taper = false; 
plate_corner_radius = 3.75; //[0:0.01:3.75]
/* [Printer bed options] */
build_plate_enabled = "disabled";//[disabled, enabled, unique]
//spread out the plates, use if last row is small.
average_plate_sizes = false;
//Will split the plate in to the 
build_plate_size = [200,250];

/* [Baseplate - Options] */

//size of magnet, diameter and height. Zacks original used 6.5 and 2.4 
Magnet_Size = magnet_size;  // .1
//raises the magnet, and creates a floor (for gluing)
Magnet_Z_Offset = 0;  // .1
//raises the magnet, and creates a ceiling to capture the magnet
Magnet_Top_Cover = 0;  // .1

//Enable screws in the bin corner under the magnets
Corner_Screw_Enabled = false;
//Enable hold down screw in the center
Center_Screw_Enabled = false;
//Enable cavity to place frame weights
Enable_Weight = false;

/* [Baseplate - Clips]*/
Connector_Only = false;
Connector_Position = "center_wall"; //["center_wall","intersection","both"]

Connector_Clip_Enabled = false;
Connector_Clip_Size = 10;
Connector_Clip_Tolerance = 0.1;

//This feature is not yet finalized, or working properly. 
Connector_Butterfly_Enabled = false;
Connector_Butterfly_Size = [5,4,1.5];
Connector_Butterfly_Radius = 0.1;
Connector_Butterfly_Tolerance = 0.1;

//This feature is not yet finalized, or working properly. 
Connector_Filament_Enabled = false;
Connector_Filament_Diameter = 2;
Connector_Filament_Length = 8;

/* [Baseplate - Custom Grid]*/
//Enable custom grid, you will configure this in the (Lid not supported)
Custom_Grid_Enabled = false;

//Custom gid sizes
//I am not sure it this is really useful, but its possible, so here we are.
//0:off the cell is off
//1:on the cell is on and all corners are rounded
//2-16, are bitwise values used to calculate what corners should be rounded, you need to subtract 2 from the value for the bitwise logic (so it does not clash with 0 and 1).
xpos1 = [3,4,0,0,3,4,0];
xpos2 = [2,2,0,0,2,2,0];
xpos3 = [2,2,0,0,2,2,0];
xpos4 = [2,2,2,2,2,2,0];
xpos5 = [6,2,2,2,2,10,0];
xpos6 = [0,0,0,0,0,0,0];
xpos7 = [0,0,0,0,0,0,0];


/* [debug] */
//Slice along the x axis
cutx = 0; //0.1
//Slice along the y axis
cuty = 0; //0.1
// enable loging of help messages during render.
enable_help = "disabled"; //[info,debug,trace]

/* [Model detail] */
//assign colours to the bin, will may 
set_colour = "enable"; //[disabled, enable, preview, lip]
//where to render the model
render_position = "zero"; //[default,center,zero]
Render_Position = render_position;
// minimum angle for a fragment (fragments = 360/fa).  Low is more fragments 
fa = 6; 
// minimum size of a fragment.  Low is more fragments
fs = 0.4; 
// number of fragments, overrides $fa and $fs
fn = 0;  
// set random seed for 
random_seed = 0; //0.0001
// force render on costly components
force_render = true;

/* [Hidden] */
module end_of_customizer_opts() {}
/*<!!end gridfinity_basic_cup!!>*/

//Some online generators do not like direct setting of fa,fs,fn
$fa = fa; 
$fs = fs; 
$fn = fn;  

// My Math...
gf_xy_base = 42;
gf_z_base = 7;
additional_screw_trap_width = max(
    screw_socket_head_diameter,
    nut_split_fit_width_corners + 2 * nut_split_fit_thickness
);
screw_socket_inset = nut_set_inset + 2 * nut_split_fit_thickness;
base_top_z = 5.6;
crown_bottom_rim_z = 7.2;
spacer_height = crown_bottom_rim_z - base_top_z;
magnet_center_edge_offset = 8.00;
magnet_center_interior_offset = 4.8;
magnet_with_rim_diameter = magnet_size[0] + 2 * magnet_size[1];
magnet_base_offset = -1 * gf_xy_base / 2 + (magnet_center_edge_offset - magnet_center_interior_offset);


module combined_base() {
    SetGridfinityEnvironment(
        width = width,
        depth = depth,
        height = height,
        render_position = render_position,
        help = enable_help,
        cutx = cutx,
        cuty = cuty,
        cutz = calcDimensionHeight(height, true),
        setColour = set_colour,
        randomSeed = random_seed,
        force_render = force_render
    )

    // "cup" provides the bottom profile
    gridfinity_cup(
    width=width, depth=depth, height=height,
    filled_in=filled_in,
    label_settings=LabelSettings(
        labelStyle=label_style, 
        labelPosition=label_position, 
        labelSize=label_size,
        labelRelief=label_relief,
        labelWalls=label_walls),
    fingerslide=fingerslide,
    fingerslide_radius=fingerslide_radius,
    fingerslide_walls=fingerslide_walls,
    fingerslide_lip_aligned=fingerslide_lip_aligned,
    cupBase_settings = CupBaseSettings(
        magnetSize = enable_magnets?magnet_size:[0,0],
        magnetEasyRelease = magnet_easy_release, 
        centerMagnetSize = center_magnet_size, 
        screwSize = enable_screws?screw_size:[0,0],
        holeOverhangRemedy = hole_overhang_remedy, 
        cornerAttachmentsOnly = box_corner_attachments_only,
        floorThickness = floor_thickness,
        cavityFloorRadius = cavity_floor_radius,
        efficientFloor=efficient_floor,
        halfPitch=half_pitch,
        flatBase=flat_base,
        spacer=spacer,
        minimumPrintablePadSize=minimum_printable_pad_size,
        flatBaseRoundedRadius = flat_base_rounded_radius,
        flatBaseRoundedEasyPrint = flat_base_rounded_easyPrint),
    wall_thickness=wall_thickness,
    chamber_wall_thickness=chamber_wall_thickness,
    chamber_wall_zClearance=chamber_wall_zClearance,
    vertical_chambers = vertical_chambers,
    vertical_separator_bend_position=vertical_separator_bend_position,
    vertical_separator_bend_angle=vertical_separator_bend_angle,
    vertical_separator_bend_separation=vertical_separator_bend_separation,
    vertical_separator_cut_depth=vertical_separator_cut_depth,
    vertical_irregular_subdivisions=vertical_irregular_subdivisions,
    vertical_separator_config=vertical_separator_config,
    horizontal_chambers=horizontal_chambers,
    horizontal_separator_bend_position=horizontal_separator_bend_position,
    horizontal_separator_bend_angle=horizontal_separator_bend_angle,
    horizontal_separator_bend_separation=horizontal_separator_bend_separation,
    horizontal_separator_cut_depth=horizontal_separator_cut_depth,
    horizontal_irregular_subdivisions=horizontal_irregular_subdivisions,
    horizontal_separator_config=horizontal_separator_config, 
    lip_style=lip_style,
    zClearance=zClearance,
    tapered_corner=tapered_corner,
    tapered_corner_size = tapered_corner_size,
    tapered_setback = tapered_setback,
    wallpattern_walls=wallpattern_walls, 
    wallpattern_dividers_enabled=wallpattern_dividers_enabled,
    wall_pattern_settings = PatternSettings(
        patternEnabled = wallpattern_enabled, 
        patternStyle = wallpattern_style, 
        patternFill = wallpattern_fill,
        patternBorder = wallpattern_hole_spacing, 
        patternHoleSize = wallpattern_hole_size, 
        patternHoleSides = wallpattern_hole_sides,
        patternHoleSpacing = wallpattern_hole_spacing, 
        patternHoleRadius = wallpattern_hole_radius,
        patternVariable = wallpattern_pattern_variable,
        patternFs = wallpattern_pattern_quality), 
    floor_pattern_settings = PatternSettings(
        patternEnabled = floorpattern_enabled, 
        patternStyle = floorpattern_style, 
        patternFill = floorpattern_fill,
        patternBorder = floorpattern_hole_spacing, 
        patternHoleSize = floorpattern_hole_size, 
        patternHoleSides = floorpattern_hole_sides,
        patternHoleSpacing = floorpattern_hole_spacing, 
        patternHoleRadius = floorpattern_hole_radius,
        patternVariable = floorpattern_pattern_variable,
        patternFs = floorpattern_pattern_quality), 
    wallcutout_vertical=wallcutout_vertical,
    wallcutout_vertical_position=wallcutout_vertical_position,
    wallcutout_vertical_width=wallcutout_vertical_width,
    wallcutout_vertical_angle=wallcutout_vertical_angle,
    wallcutout_vertical_height=wallcutout_vertical_height,
    wallcutout_vertical_corner_radius=wallcutout_vertical_corner_radius,
    wallcutout_horizontal=wallcutout_horizontal,
    wallcutout_horizontal_position=wallcutout_horizontal_position,
    wallcutout_horizontal_width=wallcutout_horizontal_width,
    wallcutout_horizontal_angle=wallcutout_horizontal_angle,
    wallcutout_horizontal_height=wallcutout_horizontal_height,
    wallcutout_horizontal_corner_radius=wallcutout_horizontal_corner_radius,
    extendable_Settings = ExtendableSettings(
        extendablexEnabled = extension_x_enabled, 
        extendablexPosition = extension_x_position, 
        extendableyEnabled = extension_y_enabled, 
        extendableyPosition = extension_y_position, 
        extendableTabsEnabled = extension_tabs_enabled, 
        extendableTabSize = extension_tab_size),
    sliding_lid_enabled = sliding_lid_enabled, 
    sliding_lid_thickness = sliding_lid_thickness, 
    sliding_min_wall_thickness = sliding_min_wallThickness, 
    sliding_min_support = sliding_min_support, 
    sliding_clearance = sliding_clearance,
    sliding_lid_lip_enabled = sliding_lid_lip_enabled,
    cupBaseTextSettings = CupBaseTextSettings(
        baseTextLine1Enabled = text_1,
        baseTextLine2Enabled = text_2,
        baseTextLine2Value = text_2_text,
        baseTextFontSize = text_size,
        baseTextFont = text_font,
        baseTextDepth = text_depth
    )
    );

    // spacer between the top and bottom to remove overhangs. A "shadow" of the
    // top baseplate
    color("purple")
    translate(v = [0, 0, base_top_z])
    linear_extrude(height = spacer_height) 
    projection(cut = true)
    gridfinity_baseplate(
        num_x = width[0],
        num_y = depth[0],
        outer_num_x = width[0],
        outer_num_y = depth[0],
        outer_height = outer_Height,
        position_fill_grid_x = "near",
        position_fill_grid_y = "near",
        position_grid_in_outer_x = "center",
        position_grid_in_outer_y = "center",
        plate_corner_radius = plate_corner_radius,
        magnetSize = Enable_Magnets ? Magnet_Size : [0,0],
        magnetZOffset = Magnet_Z_Offset,
        magnetTopCover = Magnet_Top_Cover,
        reducedWallHeight = Reduced_Wall_Height, 
        reduceWallTaper = Reduced_Wall_Taper, 
        cornerScrewEnabled  = Corner_Screw_Enabled,
        centerScrewEnabled = Center_Screw_Enabled,
        weightedEnable = Enable_Weight,
        oversizeMethod = oversize_method,
        plateOptions = Base_Plate_Options,
        customGridEnabled = Custom_Grid_Enabled,
        gridPositions = [xpos1, xpos2, xpos3, xpos4, xpos5, xpos6, xpos7],
        connectorPosition = Connector_Position,
        connectorClipEnabled  = Connector_Clip_Enabled,
        connectorClipSize = Connector_Clip_Size,
        connectorClipTolerance = Connector_Clip_Tolerance,
        connectorButterflyEnabled  = Connector_Butterfly_Enabled,
        connectorButterflySize = Connector_Butterfly_Size,
        connectorButterflyRadius = Connector_Butterfly_Radius,
        connectorButterflyTolerance = Connector_Butterfly_Tolerance,
        connectorFilamentEnabled = Connector_Filament_Enabled,
        connectorFilamentDiameter = Connector_Filament_Diameter,
        connectorFilamentLength = Connector_Filament_Length
    );

    // oversized "spacer" to be cut down for nut traps and screw holes
    color("teal")
    translate(v = [-1 * gf_xy_base / 2, 0, base_top_z])
    translate(v = [-1 * additional_screw_trap_width / 2, 0, 0]) 
    for (i=[1:1:width[0]]) {
        translate(v = [i * gf_xy_base, 0.01, 0])
        cube(size = [additional_screw_trap_width, screw_socket_inset, spacer_height]);

        translate(v = [i * gf_xy_base, depth[0] * gf_xy_base - screw_socket_inset - 0.01, 0])
        cube(size = [additional_screw_trap_width, screw_socket_inset, spacer_height]);
    }

    color("teal")
    translate(v = [0, -1 * gf_xy_base / 2, base_top_z])
    translate(v = [0, -1 * additional_screw_trap_width/2, 0]) 
    for (i=[1:1:depth[0]]) {
        translate(v = [0.01, i * gf_xy_base, 0])
        cube(size = [screw_socket_inset, additional_screw_trap_width, spacer_height]);

        translate(v = [width[0] * gf_xy_base - screw_socket_inset - 0.01, i * gf_xy_base, 0])
        cube(size = [screw_socket_inset, additional_screw_trap_width, spacer_height]);
    }

    // corner "spacer" to be cut down for magnet holes
    if (magnets == true) {
        translate(v = [-1 * gf_xy_base / 2, -1 * gf_xy_base / 2, base_top_z])
        for (i = [1 : 1 : width[0]]) {
            for (j = [ 1 : 1 : depth[0]]) {
                // center of cup
                translate(v = [i * gf_xy_base, j * gf_xy_base, 0])
                for (k = [0 : 90 : 270]) {
                    rotate(k)
                    translate(v = [magnet_base_offset - 0.5, magnet_base_offset - 0.5, 0]) {
                    cube(size=[
                        magnet_center_interior_offset + magnet_with_rim_diameter / 2,
                        magnet_center_interior_offset + 0.5,
                        spacer_height
                    ]);

                    cube(size=[
                        magnet_center_interior_offset + 0.5,
                        magnet_center_interior_offset + magnet_with_rim_diameter / 2,
                        spacer_height
                    ]);

                    translate(v = [
                        magnet_center_interior_offset,
                        magnet_center_interior_offset,
                        0
                    ])
                    cylinder(
                        d = magnet_with_rim_diameter,
                        h = spacer_height
                    );
                    }
                }
            }
        }
    }

    // add a "real" baseplate to the top to have something for bins to sit in
    translate(v = [0, 0, gf_z_base])
    gridfinity_baseplate(
        num_x = width[0],
        num_y = depth[0],
        outer_num_x = width[0],
        outer_num_y = depth[0],
        outer_height = outer_Height,
        position_fill_grid_x = "near",
        position_fill_grid_y = "near",
        position_grid_in_outer_x = "center",
        position_grid_in_outer_y = "center",
        plate_corner_radius = plate_corner_radius,
        magnetSize = Enable_Magnets ? Magnet_Size : [0,0],
        magnetZOffset = Magnet_Z_Offset,
        magnetTopCover = Magnet_Top_Cover,
        reducedWallHeight = Reduced_Wall_Height, 
        reduceWallTaper = Reduced_Wall_Taper, 
        cornerScrewEnabled  = Corner_Screw_Enabled,
        centerScrewEnabled = Center_Screw_Enabled,
        weightedEnable = Enable_Weight,
        oversizeMethod=oversize_method,
        plateOptions = Base_Plate_Options,
        customGridEnabled = Custom_Grid_Enabled,
        gridPositions=[xpos1,xpos2,xpos3,xpos4,xpos5,xpos6,xpos7],
        connectorPosition = Connector_Position,
        connectorClipEnabled  = Connector_Clip_Enabled,
        connectorClipSize = Connector_Clip_Size,
        connectorClipTolerance = Connector_Clip_Tolerance,
        connectorButterflyEnabled  = Connector_Butterfly_Enabled,
        connectorButterflySize = Connector_Butterfly_Size,
        connectorButterflyRadius = Connector_Butterfly_Radius,
        connectorButterflyTolerance = Connector_Butterfly_Tolerance,
        connectorFilamentEnabled=Connector_Filament_Enabled,
        connectorFilamentDiameter=Connector_Filament_Diameter,
        connectorFilamentLength=Connector_Filament_Length
    );
}

module slip_nut_profile(
    // flat_to_flat,
    across_corners,
    thickness,
    extra_height = 10
) {
    rotate(a = [90, 0, 0])
    cylinder(d = across_corners, h = thickness, $fn = 6);

    translate(v = [-1 * across_corners / 2, -1 * thickness, 0]) 
    cube(size = [across_corners, thickness, extra_height]);
}

difference() {
    combined_base();

    translate(v = [-1 * gf_xy_base / 2, -0.01, screw_hole_height])
    for (i=[1:1:width[0]]) {
        // main screw hole
        translate(v = [i * gf_xy_base, 0, 0])
        rotate(a = [270, 0, 0])
        cylinder(
            h=screw_hole_depth,
            d=screw_hole_diameter
        );

        translate(v = [i * gf_xy_base, depth[0] * gf_xy_base + 0.01, 0])
        rotate(a = [90, 0, 0])
        cylinder(
            h=screw_hole_depth,
            d=screw_hole_diameter
        );

        // socket head extra interior space
        translate(v = [i * gf_xy_base, screw_socket_inset, 0])
        rotate(a = [270, 0, 0])
        cylinder(
            h=screw_socket_head_depth,
            d=screw_socket_head_diameter
        );

        translate(v = [i * gf_xy_base, depth[0] * gf_xy_base - screw_socket_inset, 0])
        rotate(a = [90, 0, 0])
        cylinder(
            h=screw_socket_head_depth,
            d=screw_socket_head_diameter
        );

        // nut trap
        translate(v = [i * gf_xy_base, nut_set_inset, 0])
        slip_nut_profile(nut_split_fit_width_corners, nut_split_fit_thickness);

        translate(v = [i * gf_xy_base, depth[0] * gf_xy_base - (nut_set_inset - nut_split_fit_thickness), 0])
        slip_nut_profile(nut_split_fit_width_corners, nut_split_fit_thickness);
    }

    translate(v = [-0.01, -1 * gf_xy_base / 2, screw_hole_height]) 
    for (i=[1:1:depth[0]]) {
        // main screw hole
        translate(v = [0, i * gf_xy_base, 0])
        rotate(a = [0, 90, 0])
        cylinder(
            h=screw_hole_depth,
            d=screw_hole_diameter
        );

        translate(v = [width[0] * gf_xy_base + 0.01, i * gf_xy_base, 0])
        rotate(a = [0, 270, 0])
        cylinder(
            h=screw_hole_depth,
            d=screw_hole_diameter
        );

        // socket head extra interior space
        translate(v = [screw_socket_inset, i * gf_xy_base, 0])
        rotate(a = [0, 90, 0])
        cylinder(
            h=screw_socket_head_depth,
            d=screw_socket_head_diameter
        );

        translate(v = [width[0] * gf_xy_base - screw_socket_inset, i * gf_xy_base, 0])
        rotate(a = [0, 270, 0])
        cylinder(
            h=screw_socket_head_depth,
            d=screw_socket_head_diameter
        );

        // nut trap
        translate(v = [(nut_set_inset - nut_split_fit_thickness), i * gf_xy_base, 0])
        rotate(a = [0, 0, 90])
        slip_nut_profile(nut_split_fit_width_corners, nut_split_fit_thickness);

        translate(v = [
            width[0] * gf_xy_base - (nut_set_inset - nut_split_fit_thickness),
            i * gf_xy_base,
            0
        ])
        rotate(a = [0, 0, 270])
        slip_nut_profile(nut_split_fit_width_corners, nut_split_fit_thickness);
    }

    // magnet holes
    if (magnets == true) {
        translate(v = [
            -1 * gf_xy_base / 2,
            -1 * gf_xy_base / 2,
            crown_bottom_rim_z - magnet_size[1]
        ])
        for (i = [1 : 1 : width[0]]) {
            for (j = [ 1 : 1 : depth[0]]) {
                // center of cup
                translate(v = [i * gf_xy_base, j * gf_xy_base, 0])
                for (k = [0 : 90 : 270]) {
                // for (k = [0 : 90 : 0]) {
                    rotate(k)
                    translate(v = [
                        gf_xy_base / 2 - magnet_center_edge_offset,
                        gf_xy_base / 2 - magnet_center_edge_offset,
                        0
                    ])
                    // translate(v = [0, 0 , 0]) 
                    cylinder(
                        d = magnet_size[0],
                        h = magnet_size[1] + 0.01
                    );
                }
            }
        }
    }
}

