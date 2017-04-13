//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
//attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = vec4(1, 1, 1, 1);
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Twirl effect for portals
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 uvBounds;
uniform float time;

void main()
{
    float hw = (uvBounds.z - uvBounds.x)/2.;
    float hh = (uvBounds.w - uvBounds.y)/2.;
    vec2 center = uvBounds.xy + vec2(hw, hh); //coordinates of center
    vec2 cuv = v_vTexcoord - center; //distance vector from center
    if (length(cuv) > min(hw, hh))
    {
        gl_FragColor = vec4(0, 0, 0, 0);
    }
    else
    {
        float rot = length(cuv)*3.*(sin(time/300.) + 5.) + time/20.;
        vec2 ruv = vec2(cos(rot)*cuv.x - sin(rot)*cuv.y, sin(rot)*cuv.x + cos(rot)*cuv.y); //rotated UV coords
        ruv += center;
        gl_FragColor = texture2D( gm_BaseTexture, ruv );
    }
}

