//=====================================
// This is public Domain Code
// Contributed by: William A Adams
// 11 May 2011
// 2017-03-12: Gael Lafond
//   Original from: http://www.thingiverse.com/thing:8483
//   Fixed deprecated "for" loop usage.
//   Added module BezPolygon, which draw a single polygon that
//     can be used with linear_extrude or rotate_extrude.
//=====================================
joinfactor = 0.125;

gSteps = 4;
gHeight = 4;


//=======================================
// Functions
// These are the 4 blending functions for a cubic bezier curve
//=======================================

/*
	Bernstein Basis Functions

	For Bezier curves, these functions give the weights per control point.
	
*/
function BEZ03(u) = pow((1-u), 3);
function BEZ13(u) = 3*u*(pow((1-u),2));
function BEZ23(u) = 3*(pow(u,2))*(1-u);
function BEZ33(u) = pow(u,3);

// Calculate a singe point along a cubic bezier curve
// Given a set of 4 control points, and a parameter 0 <= 'u' <= 1
// These functions will return the exact point on the curve
function PointOnBezCubic2D(p0, p1, p2, p3, u) = [
	BEZ03(u)*p0[0]+BEZ13(u)*p1[0]+BEZ23(u)*p2[0]+BEZ33(u)*p3[0],
	BEZ03(u)*p0[1]+BEZ13(u)*p1[1]+BEZ23(u)*p2[1]+BEZ33(u)*p3[1]];

function PointOnBezCubic3D(p0, p1, p2, p3, u) = [
	BEZ03(u)*p0[0]+BEZ13(u)*p1[0]+BEZ23(u)*p2[0]+BEZ33(u)*p3[0],
	BEZ03(u)*p0[1]+BEZ13(u)*p1[1]+BEZ23(u)*p2[1]+BEZ33(u)*p3[1],
	BEZ03(u)*p0[2]+BEZ13(u)*p1[2]+BEZ23(u)*p2[2]+BEZ33(u)*p3[2]];

//=======================================
// Modules
//=======================================
// This function will extrude a bezier solid from a bezier curve
// It is a straight up prism
// c - ControlPoints
//
module BezCubicFillet(c, focalPoint, steps=gSteps, height=gHeight)
{
	for(step = [0:steps])
	{
		linear_extrude(height = height, convexity = 10) 
		polygon(
			points=[
				focalPoint,
				PointOnBezCubic2D(c[0], c[1], c[2],c[3], step/steps),
				PointOnBezCubic2D(c[0], c[1], c[2],c[3], (step-1)/steps)],
			paths=[[0,1,2,0]]
		);
	}
}

module BezCubicFilletColored(c, focalPoint, steps=gSteps, height=gHeight, colors)
{
	for(step = [0:steps])
	{
		color(PointOnBezCubic3D(colors[0], colors[1], colors[2], colors[3], step/steps))
		linear_extrude(height = height, convexity = 10) 
		polygon(
			points=[
				focalPoint,
				PointOnBezCubic2D(c[0], c[1], c[2],c[3], step/steps),
				PointOnBezCubic2D(c[0], c[1], c[2],c[3], (step-1)/steps)],
			paths=[[0,1,2,0]]
		);
	}
}


module BezCubicRibbon(c1, c2, steps=gSteps, height=gHeight, colors=[[1,0,0],[1,1,0],[0,1,1],[0,0,1]])
{
	for (step=[0:steps-1])
	{
		color(PointOnBezCubic3D(colors[0], colors[1], colors[2], colors[3], step/steps))
		linear_extrude(height = height, convexity = 10) 
		polygon(
			points=[
				PointOnBezCubic2D(c1[0], c1[1], c1[2],c1[3], step/steps),
				PointOnBezCubic2D(c2[0], c2[1], c2[2],c2[3], (step)/steps),
				PointOnBezCubic2D(c2[0], c2[1], c2[2],c2[3], (step+1)/steps),
				PointOnBezCubic2D(c1[0], c1[1], c1[2],c1[3], (step+1)/steps)],
			paths=[[0,1,2,3]]
		);

	}
}

module BezCubicRibbonRotate(c1, c2, steps=gSteps, height=gHeight, colors=[[1,0,0],[1,1,0],[0,1,1],[0,0,1]])
{
	for (step=[0:steps-1])
	{
		color(PointOnBezCubic3D(colors[0], colors[1], colors[2], colors[3], step/steps))
		rotate_extrude(convexity=10) 
		polygon(
			points=[
				PointOnBezCubic2D(c1[0], c1[1], c1[2],c1[3], step/steps),
				PointOnBezCubic2D(c2[0], c2[1], c2[2],c2[3], (step)/steps),
				PointOnBezCubic2D(c2[0], c2[1], c2[2],c2[3], (step+1)/steps),
				PointOnBezCubic2D(c1[0], c1[1], c1[2],c1[3], (step+1)/steps)],
			paths=[[0,1,2,3]]
		);
	}
}

/**
 * Points: [
 *   [point1, bezier1-2, bezier2-1, point2],
 *   [point2, bezier2-2, bezier3-1, point3],
 *   ...,
 *   [pointN, bezierN-2, bezier1-1, point1]
 * ]
 */
module BezPolygon(points, steps, drawHandles=false) {
	polygon([
		for(c = points)
			for(step = [0:steps])
				PointOnBezCubic2D(c[0], c[1], c[2],c[3], step/steps)
	]);

	if (drawHandles) {
		for(c = points) {
			drawHandle(c[0], c[1]);
			drawHandle(c[3], c[2]);
		}
	}

	module drawHandle(point, handle) {
		lineWidth = 0.5;
		circleRadius = 1;

		if (point[0] != handle[0] || point[1] != handle[1]) {
			deltaX = point[0] - handle[0];
			deltaY = point[1] - handle[1];
			distance = sqrt(deltaX*deltaX + deltaY*deltaY);
			angle = atan2(deltaY, deltaX) + 90;

			color([0, 0, 0, 0.3]) {
				// Line
				translate([point[0], point[1], 0]) {
					rotate([0, 0, angle]) {
						translate([-lineWidth/2, 0, 0]) {
							square([lineWidth, distance - circleRadius]);
						}
					}
				}

				// Handle
				translate([handle[0], handle[1], 0]) {
					difference() {
						circle(r = circleRadius);
						circle(r = circleRadius * 0.75);
					}
				}
			}
		}
		color([0, 0, 0, 0.3]) {
			// Points
			translate([point[0], point[1], 0])
				circle(r = circleRadius);
		}
	}
}
