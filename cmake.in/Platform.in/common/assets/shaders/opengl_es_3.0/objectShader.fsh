#version 100

#ifdef GL_ES
precision mediump float;
#endif

//varying vec4 destinationNormal;
varying vec4 destinationColor;
varying vec2 destinationTexCoord2D;
varying float destinationOpacity;
varying float destinationHidden;
varying mat4 destinationColorTransform;

uniform sampler2D diffuseTexture2D;
uniform sampler2D ambientTexture2D;
uniform sampler2D specularTexture2D;
uniform sampler2D normalTexture2D;
uniform sampler2D reflectiveTexture2D;
uniform sampler2D emissionTexture2D;
uniform sampler2D transparentTexture2D;
uniform sampler2D multiplyTexture2D;

uniform int u_opacityModifyRGB;

//vec3 transform3DPoint(vec3 point, mat4 matrix)
//{
//    float tx = point.x*matrix[0][0] + point.y*matrix[1][0] + point.z*matrix[2][0] + matrix[3][0];
//    float ty = point.x*matrix[0][1] + point.y*matrix[1][1] + point.z*matrix[2][1] + matrix[3][1];
//    float tz = point.x*matrix[0][2] + point.y*matrix[1][2] + point.z*matrix[2][2] + matrix[3][2];
//}

vec4 transformRGB(vec4 color, mat4 matrix)
{
	float tr = color.r*matrix[0][0] + color.g*matrix[1][0] + color.b*matrix[2][0] + matrix[3][0];
	float tg = color.r*matrix[0][1] + color.g*matrix[1][1] + color.b*matrix[2][1] + matrix[3][1];
	float tb = color.r*matrix[0][2] + color.g*matrix[1][2] + color.b*matrix[2][2] + matrix[3][2];
	
	return clamp(vec4(tr, tg, tb, color.a), 0.0, 1.0);
}

//mat4 colorScaleMatrix(vec4 colorScale)
//{
//    mat4 mmat;
//    
//    mmat[0][0] = colorScale.r;
//    mmat[0][1] = 0.0;
//    mmat[0][2] = 0.0;
//    mmat[0][3] = 0.0;
//    
//    mmat[1][0] = 0.0;
//    mmat[1][1] = colorScale.g;
//    mmat[1][2] = 0.0;
//    mmat[1][3] = 0.0;
//    
//    
//    mmat[2][0] = 0.0;
//    mmat[2][1] = 0.0;
//    mmat[2][2] = colorScale.b;
//    mmat[2][3] = 0.0;
//    
//    mmat[3][0] = 0.0;
//    mmat[3][1] = 0.0;
//    mmat[3][2] = 0.0;
//    mmat[3][3] = 1.0;
//    
//    return mmat;
//}
//
//mat4 luminanceMatrix(vec4 luminance)
//{
//    mat4 mmat;
//    float rwgt, gwgt, bwgt;
//    
//    rwgt = luminance.r;
//    gwgt = luminance.g;
//    bwgt = luminance.b;
//    mmat[0][0] = rwgt;
//    mmat[0][1] = rwgt;
//    mmat[0][2] = rwgt;
//    mmat[0][3] = 0.0;
//    
//    mmat[1][0] = gwgt;
//    mmat[1][1] = gwgt;
//    mmat[1][2] = gwgt;
//    mmat[1][3] = 0.0;
//    
//    mmat[2][0] = bwgt;
//    mmat[2][1] = bwgt;
//    mmat[2][2] = bwgt;
//    mmat[2][3] = 0.0;
//    
//    mmat[3][0] = 0.0;
//    mmat[3][1] = 0.0;
//    mmat[3][2] = 0.0;
//    mmat[3][3] = 1.0;
//    
//    return mmat;
//}
//
//mat4 saturationMatrix(float saturation, vec3 luminance)
//{
//    mat4 mmat;
//    float a, b, c, d, e, f, g, h, i;
//    float rwgt, gwgt, bwgt;
//    
//    rwgt = luminance.r;
//    gwgt = luminance.g;
//    bwgt = luminance.b;
//    
//    a = (1.0-sat)*rwgt + sat;
//    b = (1.0-sat)*rwgt;
//    c = (1.0-sat)*rwgt;
//    d = (1.0-sat)*gwgt;
//    e = (1.0-sat)*gwgt + sat;
//    f = (1.0-sat)*gwgt;
//    g = (1.0-sat)*bwgt;
//    h = (1.0-sat)*bwgt;
//    i = (1.0-sat)*bwgt + sat;
//    mmat[0][0] = a;
//    mmat[0][1] = b;
//    mmat[0][2] = c;
//    mmat[0][3] = 0.0;
//    
//    mmat[1][0] = d;
//    mmat[1][1] = e;
//    mmat[1][2] = f;
//    mmat[1][3] = 0.0;
//    
//    mmat[2][0] = g;
//    mmat[2][1] = h;
//    mmat[2][2] = i;
//    mmat[2][3] = 0.0;
//    
//    mmat[3][0] = 0.0;
//    mmat[3][1] = 0.0;
//    mmat[3][2] = 0.0;
//    mmat[3][3] = 1.0;
//    
//    return mmat;
//}
//
//mat4 colorOffset(vec4 color)
//{
//    mat4 mmat;
//    
//    mmat[0][0] = 1.0;
//    mmat[0][1] = 0.0;
//    mmat[0][2] = 0.0;
//    mmat[0][3] = 0.0;
//    
//    mmat[1][0] = 0.0;
//    mmat[1][1] = 1.0;
//    mmat[1][2] = 0.0;
//    mmat[1][3] = 0.0;
//    
//    mmat[2][0] = 0.0;
//    mmat[2][1] = 0.0;
//    mmat[2][2] = 1.0;
//    mmat[2][3] = 0.0;
//    
//    mmat[3][0] = color.r;
//    mmat[3][1] = color.g;
//    mmat[3][2] = color.b;
//    mmat[3][3] = 1.0;
//    
//    return mmat;
//}

void main(void)
{
	vec4 destOpacityColor = vec4(1.0, 1.0, 1.0, destinationOpacity);
	
    if(destinationHidden != 0.0)
        discard;
    
    vec4 color = destinationColor;
    int modifyRGB = u_opacityModifyRGB;
    
    vec4 diffuseColor = texture2D(diffuseTexture2D, destinationTexCoord2D);
    
    if (modifyRGB == 1) 
    {
        color = vec4(destinationColor.r * destinationColor.a,
                     destinationColor.g * destinationColor.a,
                     destinationColor.b * destinationColor.a,
                     destinationColor.a);
    }
    
    color = (color * diffuseColor * destOpacityColor);
//    color = (color * diffuseColor);
    
    color = transformRGB(color, destinationColorTransform);
    
    
    
    
    if (color.a == 0.0)
    {
        discard;
    }
    
    
    gl_FragColor = color;
}
