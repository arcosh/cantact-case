
/*
 * See also:
 * https://www.nxp.com/docs/en/application-note/AN4388.pdf
 */

color_package_mold = "black";

module lqfp48()
{
    color(color_package_mold)
    cube([
        7.0,
        7.0,
        1.0
        ]);
}

lqfp48();
